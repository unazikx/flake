# INFO:
# just simple bar for you
# nothing garbage

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
          partsConfig,
          ...
        }:
        {
          imports = lib.attrValues {
            inherit (partsConfig.nixosModules)
              playerctl
              ;
          };

          hm.programs.waybar = {
            enable = true;

            systemd = {
              enable = true;
              targets = [ "niri.service" ];
            };

            style = import ./style.nix {
              inherit
                config
                ;
            };

            settings = import ./settings.nix {
              inherit
                pkgs
                lib
                config
                ;
            };
          };
        };
    };
}
