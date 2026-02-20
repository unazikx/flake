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
          persist.user.directories = [
            ".local/share/AyuGramDesktop/tdata"
          ];

          hmPackages = [ pkgs.ayugram-desktop ];

          hm = {
            xdg = {
              mimeApps = {
                defaultApplications = (t: l: (lib.genAttrs l (n: t))) "com.ayugram.desktop.desktop" [
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
                      pkgs.walogram.override {
                        inherit (config.hm.xdg) cacheHome;
                        inherit (config.stylix) image;
                        inherit (config.lib.stylix.colors.withHashtag)
                          base00
                          base01
                          ;

                        themeColors = import ./palette.nix {
                          inherit config;
                        };
                      }
                    )
                  }";
            };
          };
        };
    };
}
