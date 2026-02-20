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
        {
          hm.wayland.windowManager.sway = {
            enable = true;

            package = pkgs.swayfx;

            config = (
              import ./settings/main.nix {
                inherit
                  pkgs
                  lib
                  config
                  ;
              }
            );

            extraConfig = (
              import ./settings/extra.nix {
                inherit
                  config
                  ;
              }
            );

            swaynag = {
              enable = true;

              settings = (
                import ./swaynag.nix {
                  inherit
                    config
                    ;
                }
              );
            };

            checkConfig = false;
            xwayland = true;
            systemd.enable = true;
          };
        };
    };
}
