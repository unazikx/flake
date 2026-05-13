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
