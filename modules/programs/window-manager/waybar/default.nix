# INFO:
# just simple bar for you
# nothing garbage

{
  flake =
    {
      _config,
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
        {
          imports = lib.attrValues {
            inherit (_config.nixosModules)
              playerctl
              ;
          };

          hm.programs.waybar = {
            enable = true;
            systemd.enable = true;

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
