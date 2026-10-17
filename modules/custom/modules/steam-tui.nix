{
  zen.custom.steam-tui = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.steam-tui;
        ini = pkgs.formats.ini { };
      in
      {
        options = {
          programs.steam-tui = {
            enable = lib.mkEnableOption "Steam-TUI, tui client for Steam";

            package = lib.mkPackageOption pkgs "steam-tui" {
              nullable = true;
            };

            settings = lib.mkOption {
              type = ini.type;
              default = { };
              description = "Steam-TUI settings.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.configFile = {
            "steam-tui/settings".source = lib.mkIf (cfg.settings != null) (
              ini.generate "steam-tui.settings" cfg.settings
            );
          };
        };
      };
  };
}
