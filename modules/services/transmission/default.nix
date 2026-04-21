# INFO:
# another torrent client with web ui as flood

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
          cfg = config.services.transmission;
          savePath = "/media/torrents";
        in
        {
          persist.directories = [
            "/var/lib/transmission"
            savePath
          ];

          packages = [
            pkgs.own.torque
          ];

          services = {
            transmission = {
              enable = true;
              openFirewall = true;
              openPeerPorts = true;
              openRPCPort = true;

              package = pkgs.transmission_4;
              webHome = pkgs.flood-for-transmission;
              downloadDirPermissions = "775";
              performanceNetParameters = true;

              settings = {
                download-dir = savePath;
                incomplete-dir = savePath + "/temp";
                umask = "002";

                download-queue-size = 3;

                start-added-torrents = false;

                default-trackers = lib.readFile (
                  pkgs.fetchurl {
                    url = "https://raw.githubusercontent.com/XIU2/TrackersListCollection/refs/heads/master/all.txt";
                    sha256 = "sha256-3XHcMnBzPaXxjCNGSLpdgqXQA57/xHEwP1dy7k7g8qc=";
                  }
                );
                # idk why

                rpc-authentication-required = false;

                rpc-host-whitelist-enabled = true;
                rpc-host-whitelist = "0.0.0.0,localhost";

                rpc-whitelist-enabled = true;
                rpc-whitelist = "0.0.0.0";

                peer-port-random-on-start = true;
                peer-limit-per-torrent = 5;
                upload-slots-per-torrent = 2;
              };

              # INFO:
              # {
              #   "rpc-username": "yourUser",
              #   "rpc-password": "password"
              # }
              credentialsFile = config.sopsnix."services/transmission";
            };

            services.caddy.virtualHosts =
              lib.genAttrs
                [
                  "transmission.${lib.hostName}.local"
                ]
                (_: {
                  extraConfig = ''
                    encode zstd gzip
                    reverse_proxy http://0.0.0.0:${toString cfg.settings.rpc-port}
                  '';
                });
          };

          tmp.transmission = {
            "${savePath}".d = {
              inherit (cfg)
                user
                group
                ;

              mode = "0775";
            };
          };
        };
    };
}
