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
          hm = {
            programs.niri = {
              enable = true;
              package = pkgs.niri-unstable;

              settings = import ./settings.nix {
                inherit
                  pkgs
                  lib
                  config
                  ;
              };

              extraConfig = lib.mkAfter (
                with config.lib.stylix.colors.withHashtag;
                ''
                  recent-windows {
                    debounce-ms 750
                    open-delay-ms 150

                    highlight {
                      active-color "${base04}ff"
                      urgent-color "${base08}ff"
                      padding 30
                      corner-radius 12
                    }

                    previews {
                      max-height 480
                      max-scale 0.5
                    }

                    binds {
                      Alt+Tab         { next-window; }
                      Alt+Shift+Tab   { previous-window; }
                    }
                  }
                ''
              );
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

              configPackages = [
                pkgs.xdg-desktop-portal-gnome
                pkgs.xdg-desktop-portal-gtk
              ];
            };
          };

          # та же хуйня:wq
          services = {
            gnome.gnome-keyring.enable = lib.mkForce false;

            greetd.settings = {
              initial_session = {
                user = lib.userName;
                command = lib.getExe' config.hm.programs.niri.package "niri-session";
              };
            };
          };
        };
    };
}
