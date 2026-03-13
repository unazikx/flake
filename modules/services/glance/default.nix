# INFO:
# best dashboard
# fr, i use it everyday
#
# ...нет напиздел, еще делаю

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
          cfg = config.services.glance;
          isRu = true;
        in
        {
          sops.secrets = {
            "services/glance" = {
              restartUnits = [ "glance.service" ];
            };
          };

          services = {
            glance = {
              enable = true;
              openFirewall = true;

              environmentFile = config.sopsnix."services/glance";

              settings = (
                import ./settings.nix {
                  inherit lib config isRu;

                  mkHsl = (
                    import ./mkHsl.nix {
                      inherit lib config;
                    }
                  );
                }
              );
            };

            caddy.virtualHosts =
              lib.genAttrs
                [
                  "${lib.hostName}.local"
                  "glance.${lib.hostName}.local"
                ]
                (_: {
                  extraConfig = ''
                    encode zstd gzip
                    reverse_proxy http://0.0.0.0:${toString cfg.settings.server.port}
                  '';
                });
          };
        };
    };
}
