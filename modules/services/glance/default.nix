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
                  "${lib.hostName}"
                ]
                (_: {
                  extraConfig = ''
                    tls internal
                    reverse_proxy http://127.0.0.1:${toString cfg.settings.server.port}
                  '';
                });
          };
        };
    };
}
