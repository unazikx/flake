{
  flake =
    {
      partsConfig,
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
          port = 8113;
          cfg = config.services.qbittorrent;
        in
        {
          imports = lib.attrValues {
            inherit (partsConfig.nixosModules)
              qbittorrent
              ;
          };

          persist.directories = [ "/var/lib/flood" ];

          systemd.services.flood =
            (lib.genAttrs [
              "after"
              "wantedBy"
            ] (n: [ "qbittorrent.service" ]))
            // {
              path = lib.attrValues { inherit (pkgs) mediainfo; };

              serviceConfig = {
                Type = "simple";

                User = "flood";
                Group = "users";

                StateDirectory = [ "flood" ];
                StateDirectoryMode = lib.mkDefault 775;

                ExecStart = lib.concatStringsSep " " [
                  (lib.getExe (
                    # WARN:
                    # dont forget to delete when will update
                    pkgs.flood.overrideAttrs rec {
                      version = "4.12.5";
                      src = pkgs.fetchFromGitHub {
                        owner = "jesec";
                        repo = "flood";
                        tag = "v${version}";
                        hash = "sha256-4lmP8RRHALN8XPKZEW2jfFzwPyux5H33rF3dYxJ9u/U=";
                      };
                    }
                  ))
                  "--auth none"
                  "--rundir /var/lib/flood"
                  "--host 0.0.0.0"
                  "--port ${toString port}"
                  "--qburl http://${cfg.serverConfig.Preferences.WebUI.Address}:${toString cfg.webuiPort}"
                  "--qbuser ${lib.userName}"
                  "--qbpass simplepassword"
                ];
              };
            };

          services.caddy.virtualHosts =
            lib.genAttrs
              [
                "${lib.hostName}"
              ]
              (_: {
                extraConfig = ''
                  tls internal
                  redir /flood /flood/ 308
                  handle_path /flood/* {
                    reverse_proxy http://127.0.0.1:${toString port}
                  }
                '';
              });

          users = {
            users.flood = {
              isSystemUser = true;
              group = "users";
            };
          };
        };
    };
}
