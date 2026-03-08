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

            systemd.user.services.stylix-bg-niri = {
              Unit = {
                Description = "Sets stylix image as background for niri";
                After = [ "niri.service" ];
              };

              Service = {
                ExecStart = lib.concatStringsSep " " [
                  (lib.getExe pkgs.swaybg)
                  "--image"
                  config.stylix.image
                ];

                Type = "simple";
                KillMode = "process";
                Restart = "on-failure";
                RestartSec = 5;
              };

              Install.WantedBy = [ "graphical-session.target" ];
            };
          };
        };
    };
}
