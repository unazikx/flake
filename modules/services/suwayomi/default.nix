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
          lib,
          config,
          ...
        }:
        let
          localDir = config.hm.xdg.userDirs.desktop + "/localManga";
        in
        {
          persist.user.directories = [ ".local/share/Tachidesk" ];

          services.suwayomi-server = {
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
          //
            # INFO:
            # system user cause local dir
            (lib.genAttrs [
              "user"
              "group"
            ] (_: lib.userName));
        };
    };
}
