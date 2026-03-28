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

            # fucking idiots why blyat?
            # я вас всех в жопу ебал бляди нахуя
            services.gnome-keyring.enable = lib.mkForce false;

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
