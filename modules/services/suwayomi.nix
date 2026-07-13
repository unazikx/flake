{
  ...
}:

{
  zen.services.suwayomi = {
    description = ''
      server for manga/manhwa reading
      with builtin webui
    '';

    nixos =
      {
        lib,
        config,
        ...
      }:
      let
        cfg = config.services.suwayomi-server;
      in
      {
        services.suwayomi-server = {
          enable = true;

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

            downloadsPath = "${cfg.dataDir}/downloads";

            # syncYomiEnabled = true;
            # syncYomiHost = syncyomi.config.host;
            # syncYomiApiKey = "...";
            # syncInterval = 2;
          };
        };

        services.caddy.virtualHosts =
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
}
