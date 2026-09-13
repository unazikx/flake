{
  zen.custom._64gram = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs._64gram;
        json = pkgs.formats.json { };
      in
      {
        options = {
          programs._64gram = {
            enable = lib.mkEnableOption "64gram, a messaging app";

            package = lib.mkPackageOption pkgs "_64gram" {
              nullable = true;
            };

            enableMime = lib.mkEnableOption "register tg:// protocol handlers in mimeApps";

            settings = lib.mkOption {
              type = json.type;
              default = { };
              description = "64gram settings for enhanced-settings-custom.json.";
            };

            experiments = lib.mkOption {
              type = json.type;
              default = { };
              description = "64gram settings for experimental_options.json.";
            };

            shortcuts = lib.mkOption {
              type = lib.types.listOf lib.types.attrs;
              default = [ ];
              description = "64gram shortcuts for shortcuts-custom.json.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.mimeApps.defaultApplications = lib.mkIf cfg.enableMime {
            "application/x-xdg-protocol-tg" = "io.github.tdesktop_x64.TDesktop.desktop";
            "x-scheme-handler/tg" = "io.github.tdesktop_x64.TDesktop.desktop";
          };

          xdg.dataFile = {
            "64Gram/tdata/enhanced-settings-custom.json".source = lib.mkIf (cfg.settings != { }) (
              json.generate "64gram-settings.json" cfg.settings
            );

            "64Gram/tdata/experimental_options.json".source = lib.mkIf (cfg.settings != { }) (
              json.generate "64gram-experiments.json" cfg.experiments
            );

            "64Gram/tdata/shortcuts-custom.json".source = lib.mkIf (cfg.shortcuts != [ ]) (
              json.generate "64gram-shortcuts.json" cfg.shortcuts
            );
          };
        };
      };
  };
}
