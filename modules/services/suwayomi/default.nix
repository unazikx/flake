# INFO:
# server for manga/manhwa reading
# with builtin webui

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        let
          cfg = config.services.suwayomi-server;

          localDir = config.hm.xdg.userDirs.desktop + "/localManga";
        in
        {
          hmPackages = [
            pkgs.moku
          ];

          persist.user.directories = [
            ".local/share/Tachidesk"
          ];

          services = {
            suwayomi-server = lib.mkMerge [
              {
                enable = true;

                # WARN:
                # idk why it is not works
                # https://github.com/Suwayomi/Suwayomi-Server/pull/1813
                #
                # package = pkgs.suwayomi;
                # suwayomi with syncyomi support

                dataDir = config.hm.home.homeDirectory;

                settings.server = {
                  ip = "0.0.0.0";
                  port = 4567;

                  initialOpenInBrowserEnabled = false;

                  globalUpdateInterval = 6.0;
                  extensionRepos = (
                    map (p: ("https://raw.githubusercontent.com/" + p)) [
                      "yuzono/manga-repo/repo/index.min.json"
                    ]
                  );

                  updateMangas = true;
                  downloadAsCbz = true;
                  downloadConversions = lib.listToAttrs (
                    map
                      (list: {
                        name = list.from;
                        value = {
                          target = list.to;
                          compressionLevel = 0.8;
                        };
                      })
                      [
                        {
                          from = "image/webp";
                          to = "image/jpeg";
                        }
                        {
                          from = "image/png";
                          to = "image/jpeg";
                        }
                      ]
                  );

                  downloadsPath = localDir;

                  # syncYomiEnabled = true;
                  # syncYomiHost = syncyomi.config.host;
                  # syncYomiApiKey = "...";
                  # syncInterval = 2;
                };
              }

              # INFO:
              # system user cause local dir
              (lib.genAttrs [
                "user"
                "group"
              ] (_: lib.userName))
            ];

            caddy.virtualHosts =
              lib.genAttrs
                [
                  "suwayomi.${lib.hostName}.local"
                ]
                (_: {
                  extraConfig = ''
                    encode zstd gzip
                    reverse_proxy http://${cfg.settings.server.ip}:${toString cfg.settings.server.port}
                  '';
                });
          };
        };
    };
}
