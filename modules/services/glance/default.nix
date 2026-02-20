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
          isRu = true;
        in
        {
          sops.secrets = {
            "services/glance" = {
              restartUnits = [ "glance.service" ];
            };
          };

          services.glance = {
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
        };
    };
}
