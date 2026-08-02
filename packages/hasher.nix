{
  writeTextFile,
  python312Packages,
  lib,
}:

python312Packages.buildPythonApplication {
  pname = "hasher";
  version = "git";

  src = writeTextFile {
    name = "hasher";

    text =
      # python
      ''
        #!/usr/bin/env python

        import sys
        import hashlib
        import base64
        import os

        def hash_file(path):
          with open(path, "rb") as f:
            data = f.read()
          print("sha256-" + base64.b64encode(hashlib.sha256(data).digest()).decode())

        def hash_url(url):
          import urllib.request
          with urllib.request.urlopen(urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})) as r:
            data = r.read()
          print("sha256-" + base64.b64encode(hashlib.sha256(data).digest()).decode())

        def main():
          if len(sys.argv) != 2:
            print("Usage: hash_nix.py <file_or_url>")
            sys.exit(1)
          arg = sys.argv[1]
          if arg.startswith("http://") or arg.startswith("https://"):
            hash_url(arg)
          elif os.path.isfile(arg):
            hash_file(arg)
          else:
            print("Error: not a valid file or URL")
            sys.exit(1)

        if __name__ == "__main__":
          main()
      '';
  };

  dontUnpack = true;
  format = "other";

  installPhase = ''
    install -Dm755 $src $out/bin/hasher
  '';

  meta = {
    description = "Calculate Nix hash for links or local files";
    license = lib.licenses.wtfpl;
    mainProgram = "hasher";
  };
}
