# INFO:
# best messaging
#
# WARN:
# modded telegram -> ayugram
# BUR without spy and save deleted
# i respect deleted messages
# i use it ONLY for bw (black-white)
#   icon in tray

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
              telegram-ws-proxy
              ;
          };

          persist.user.directories = [
            ".local/share/AyuGramDesktop/tdata"
          ];

          hmPackages = [
            pkgs.ayugram-desktop
          ];

          hm = {
            xdg = {
              mimeApps = {
                defaultApplications = (t: l: (lib.genAttrs l (_n: t))) "com.ayugram.desktop.desktop" [
                  "application/x-xdg-protocol-tg"
                  "x-scheme-handler/tg"
                ];
              };

              dataFile = import ./configs.nix {
                inherit
                  config
                  ;
              };
            };

            systemd.user.services.telegram-tray = {
              Unit = {
                Description = pkgs.ayugram-desktop.meta.description;
                After = [ "graphical-session.target" ];
              };

              Service = {
                ExecStart = lib.concatStringsSep " " [
                  (lib.getExe pkgs.ayugram-desktop)
                  "-startintray"
                ];

                Type = "simple";
                KillMode = "process";
                Restart = "on-failure";
                RestartSec = 5;
              };

              Install.WantedBy = [ "graphical-session.target" ];
            };

            home.activation = lib.mkIf config.hm.stylix.enable {
              telegramTheme =
                lib.hm.dag.entryAfter [ "" ]
                  "run ${
                    lib.getExe (
                      pkgs.own.walogram.override {
                        cacheDir = config.hm.xdg.cacheHome;
                        colors = config.lib.stylix.colors.withHashtag;
                      }
                    )
                  }";
            };
          };
        };
    };
}
