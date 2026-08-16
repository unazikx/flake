{
  zen.custom.spotatui = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.spotatui;
        yaml = pkgs.formats.yaml { };
      in
      {
        imports = lib.singleton (
          lib.stylix.mkTarget
            {
              name = "spotatui";
              humanName = "Spotatui";
            }
            {
              config = [
                ({ ... }: {
                  programs.spotatui.settings = {
                    theme = {
                      preset = "Custom";
                      active = "Cyan";
                      banner = "Red";
                      error_border = "Red";
                      error_text = "Black";
                      hint = "Green";
                      hovered = "Green";
                      inactive = "Gray";
                      playbar_background = "Reset";
                      playbar_progress = "Green";
                      playbar_progress_text = "Reset";
                      playbar_text = "Reset";
                      selected = "Yellow";
                      text = "Reset";
                      background = "Reset";
                      header = "Reset";
                      highlighted_lyrics = "Yellow";
                    };
                  };
                })
              ];
            }
        );

        options = {
          programs.spotatui = {
            enable = lib.mkEnableOption "Spotatui, TUI Spotify, Navidrome and local player";

            package = lib.mkPackageOption pkgs "spotatui" {
              nullable = true;
            };

            settings = lib.mkOption {
              type = yaml.type;
              default = null;
              description = "Content for $XDG_CONFIG_HOME/spotatui/config.yml, written when non-null.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.configFile = {
            "spotatui/config.yml".source = lib.mkIf (cfg.settings != null) (
              yaml.generate "spotatui-config.yml" cfg.settings
            );
          };
        };
      };
  };
}
