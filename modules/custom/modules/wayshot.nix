{
  zen.custom.wayshot = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.wayshot;
        toml = pkgs.formats.toml { };
      in
      {
        imports = lib.singleton (
          lib.stylix.mkTarget
            {
              name = "wayshot";
              humanName = "Wayshot";
            }
            {
              config = [
                ({ colors, ... }: {
                  programs.wayshot.settings = {
                    geometry = {
                      foreground_color = "${colors.withHashtag.base0E}ff";
                      background_color = "${colors.withHashtag.base00}aa";
                    };
                  };
                })
              ];
            }
        );

        options = {
          programs.wayshot = {
            enable = lib.mkEnableOption "Wayshot, screenshot tool for wayland compositors";

            package = lib.mkPackageOption pkgs "wayshot" {
              nullable = true;
            };

            settings = lib.mkOption {
              type = toml.type;
              default = { };
              description = "Wayshot configuration options written to XDG config in TOML format.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.configFile = {
            "wayshot/config.toml".source = lib.mkIf (cfg.settings != { }) (
              toml.generate "wayshot-config.toml" cfg.settings
            );
          };
        };
      };
  };
}
