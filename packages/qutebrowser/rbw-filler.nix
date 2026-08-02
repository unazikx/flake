{
  writeTextFile,
  python312Packages,
  lib,
}:

python312Packages.buildPythonApplication {
  pname = "rbw-filler";
  version = "git";

  src = writeTextFile {
    name = "hasher";

    text =
      # python
      ''
        #!/usr/bin/env python
        import json
        import os
        import re
        import subprocess
        import sys
        from urllib.parse import urlparse

        D = 50

        def cmd(c):
          with open(os.environ["QUTE_FIFO"], "w") as f:
            f.write(c + "\n")
            f.flush()

        def msg(t, m):
          cmd('{} "{}"'.format(t, m))

        def unlocked():
          try:
            subprocess.run(["rbw", "unlocked"], check=True, capture_output=True)
            return True
          except subprocess.CalledProcessError:
            msg("message-info", "Bitwarden is locked. Running rbw unlock...")
            try:
              subprocess.run(["rbw", "unlock"], check=True)
              msg("message-info", "Bitwarden unlocked successfully")
              return True
            except subprocess.CalledProcessError:
              msg("message-error", "Failed to unlock Bitwarden")
              return False

        def domains(url):
          netloc = re.sub(r"^www\.", "", urlparse(url).netloc)
          if not netloc:
            return None, None
          parts = netloc.split(".")
          if len(parts) < 2:
            return netloc, netloc
          last = ".".join(parts[-2:])
          if re.match(r"^(co|com|gov|ac|org|net)\.[a-z]{2}$", last) and len(parts) >= 3:
            full = ".".join(parts[-3:])
          else:
            full = last
          return full, full.split(".")[0]

        def entry_details(name):
          try:
            out = subprocess.run(["rbw", "get", name, "--raw"], capture_output=True, text=True, check=True).stdout
            return json.loads(out)
          except (subprocess.CalledProcessError, json.JSONDecodeError):
            return None

        def find(url):
          full, base = domains(url)
          if not full:
            return None, None
          try:
            entries = [l.strip() for l in subprocess.run(["rbw", "list"], capture_output=True, text=True, check=True).stdout.strip().split("\n") if l.strip()]
          except subprocess.CalledProcessError:
            return None, None

          for n in entries:
            e = entry_details(n)
            if not e:
              continue
            for u in e.get("data", {}).get("uris", []):
              if domains(u.get("uri", ""))[0] == full:
                return e, full

          if full != base:
            for n in entries:
              e = entry_details(n)
              if not e:
                continue
              for u in e.get("data", {}).get("uris", []):
                ef, eb = domains(u.get("uri", ""))
                if eb == base or ef == base:
                  return e, base
          return None, None

        def fill(u, p, mode, match, name):
          def text(c):
            cmd("insert-text {}".format(c))

          if mode == "username":
            (msg("message-info", "Filling username: (matched: {})".format(match)) and text(u)) if u else msg("message-error", "No username for this entry: (matched: {})".format(match))
          elif mode == "password":
            (msg("message-info", "Filling password: (matched: {})".format(match)) and text(p)) if p else msg("message-error", "No password for this entry: (matched: {})".format(match))
          elif mode == "totp":
            try:
              t = subprocess.run(["rbw", "totp", name], capture_output=True, text=True, check=True).stdout.strip()
            except subprocess.CalledProcessError:
              t = None
            (msg("message-info", "TOTP code entered: {} (matched: {})".format(t, match)) and text(t)) if t else msg("message-error", "No TOTP for this entry: (matched: {})".format(match))
          else:
            if u and p:
              msg("message-info", "Filling username and password: (matched: {})".format(match))
              cmd("insert-text {} ;; cmd-later {} fake-key <Tab> ;; cmd-later {} insert-text {}".format(u, D, D * 2, p))
            else:
              msg("message-error", "No login for this entry: (matched: {})".format(match))

        def main():
          mode = sys.argv[1] if len(sys.argv) > 1 else "both"
          url = os.environ.get("QUTE_URL")
          fifo = os.environ.get("QUTE_FIFO")
          if not all([url, fifo]):
            msg("message-error", "Missing required qutebrowser environment variables")
            return 1
          if not unlocked():
            return 1
          entry, match = find(url)
          if not entry:
            msg("message-error", "No matching entry found for this URL")
            return 1
          if mode == "totp":
            fill(None, None, mode, match, entry.get("name", ""))
            return 0
          fill(entry.get("data", {}).get("username", ""), entry.get("data", {}).get("password", ""), mode, match, entry.get("name", ""))
          return 0

        if __name__ == "__main__":
          sys.exit(main())
      '';
  };

  dontUnpack = true;
  format = "other";

  installPhase = ''
    install -Dm755 $src $out/bin/hasher
  '';

  meta = {
    description = "Fill logins via rbw from qutebrowser";
    license = lib.licenses.wtfpl;
    mainProgram = "rbw-filler";
  };
}
