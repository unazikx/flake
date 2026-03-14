# INFO:
# the best window manager ever

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
          programs.niri = {
            enable = true;
            package = pkgs.niri-unstable;
          };

          hm = {
            programs.niri = {
              inherit (config.programs.niri)
                enable
                package
                ;

              settings = import ./settings.nix {
                inherit
                  pkgs
                  lib
                  config
                  ;
              };
            };

            xdg.portal = {
              config.niri = {
                default = [
                  "gtk"
                  "gnome"
                ];
              };

              extraPortals = [
                pkgs.xdg-desktop-portal-gnome
                pkgs.xdg-desktop-portal-gtk
              ];
            };
          };
        };
    };
}
