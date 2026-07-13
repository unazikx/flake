{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.ayugram-desktop;
  json = pkgs.formats.json { };
in

{
  imports = lib.singleton (
    lib.stylix.mkTarget
      {
        name = "ayugram-desktop";
        humanName = "Ayugram Desktop";
      }
      {
        config = [
          ({ colors }: {
            home.activation = {
              telegramTheme =
                lib.hm.dag.entryAfter [ ]
                  "run ${
                    lib.getExe (
                      cfg.themePackage.override {
                        cacheDir = config.xdg.cacheHome;
                        colors = colors.withHashtag;
                      }
                    )
                  }";
            };
          })
        ];
      }
  );

  options = {
    programs.ayugram-desktop = {
      enable = lib.mkEnableOption "Ayugram Desktop, a messaging app";

      package = lib.mkPackageOption pkgs "ayugram-desktop" {
        nullable = true;
      };

      enableMime = lib.mkEnableOption "register tg:// protocol handlers in mimeApps";

      themePackage = lib.mkPackageOption pkgs "walogram" {
        nullable = true;
      };

      settings = lib.mkOption {
        type = lib.types.attrs;
        default = { };
        description = "AyuGram settings for ayu_settings.json.";
      };

      shortcuts = lib.mkOption {
        type = lib.types.listOf lib.types.attrs;
        default = [ ];
        description = "AyuGram shortcuts for shortcuts-custom.json.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

    xdg.mimeApps.defaultApplications = lib.mkIf cfg.enableMime {
      "application/x-xdg-protocol-tg" = "com.ayugram.desktop.desktop";
      "x-scheme-handler/tg" = "com.ayugram.desktop.desktop";
    };

    xdg.dataFile = {
      "AyuGramDesktop/tdata/ayu_settings.json".source = lib.mkIf (cfg.settings != { }) (
        json.generate "ayugram-settings.json" cfg.settings
      );
      "AyuGramDesktop/tdata/shortcuts-custom.json".source = lib.mkIf (cfg.shortcuts != [ ]) (
        json.generate "ayugram-shortcuts.json" cfg.shortcuts
      );
    };
  };
}
