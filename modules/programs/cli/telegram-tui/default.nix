# INFO:
# tui tg client
# what to say?

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          config,
          ...
        }:
        {
          persist.user.directories = [ ];

          hmPackages = [
            pkgs.tg
          ];

          hm.xdg.configFile = {
            "tg/conf.py".text =
              # python
              ''
                import os

                def get_secret(path):
                  with open(path, "r", encoding="utf-8") as f:
                    return f.read().strip()

                # you can use
                # get_secret("secret")
                # for import number from ~/.config/tg/secret
                # or from nix secret management
                PHONE = get_secret("${config.sopsnix."accounts/tg"}")

                EDITOR = os.environ.get("EDITOR");
                LONG_MSG_CMD = os.environ.get("EDITOR");

                # pizdec...
                VOICE_RECORD_CMD = "ffmpeg -f alsa -i default -c:a flac {file_path}"

                CHAT_FLAGS = {
                    "online": "●",
                    "pinned": "P",
                    "muted": "M",
                    "unread": "U",
                    "unseen": "✓",
                    "secret": "S",
                    "seen": "✓✓",  # leave empty if you don't want to see it
                }

                MSG_FLAGS = {
                    "selected": "*",
                    "forwarded": "F",
                    "new": "N",
                    "unseen": "U",
                    "edited": "E",
                    "pending": "⟳",
                    "failed": "✗",
                    "seen": "✓✓",  # leave empty if you don't want to see it
                }

                URL_VIEW = 'urlview'
                USERS_COLORS = tuple(range(2, 16))
                KEEP_MEDIA = 7
                FILE_PICKER_CMD = "yazi --choosefile={file_path}"
                DOWNLOAD_DIR = os.path.expanduser("~/Downloads")
              '';
          };
        };
    };
}
