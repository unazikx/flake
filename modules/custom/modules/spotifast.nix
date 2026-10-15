{
  zen.custom.spotifast = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.spotifast;
        json = pkgs.formats.json { };
      in
      {
        imports = lib.singleton (
          lib.stylix.mkTarget
            {
              name = "spotifast";
              humanName = "Spotifast";
            }
            {
              config = [
                ({ polarity, colors, ... }: {
                  programs.spotifast = {
                    settings = {
                      custom_theme = "stylix.json";
                    };
                  };

                  xdg.configFile = {
                    "spotifast/themes/stylix.json" = {
                      source = json.generate "spotifast-stylix.json" {
                        base = polarity;
                        colors = {
                          window = colors.withHashtag.base00;
                          panel = colors.withHashtag.base01;
                          surface = colors.withHashtag.base02;
                          surface_hover = colors.withHashtag.base03;
                          surface_active = colors.withHashtag.base04;
                          outline = colors.withHashtag.base03;
                          text = colors.withHashtag.base05;
                          secondary = colors.withHashtag.base04;
                          dim = colors.withHashtag.base03;
                          accent = colors.withHashtag.base0B;
                          accent_hover = colors.withHashtag.base0B;
                          on_accent = colors.withHashtag.base00;
                          danger = colors.withHashtag.base08;
                          warning = colors.withHashtag.base0A;
                          overlay = colors.withHashtag.base02;
                        };
                      };
                      force = true;
                    };
                  };
                })
              ];
            }
        );

        options = {
          programs.spotifast = {
            enable = lib.mkEnableOption "spotifast, EGUI Spotify player";

            package = lib.mkPackageOption pkgs "spotifast" {
              nullable = true;
            };

            settings = lib.mkOption {
              type = json.type;
              default = null;
              description = "Content for $XDG_CONFIG_HOME/spotifast/settings.json, written when non-null.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.configFile = lib.mkIf (cfg.settings != null) {
            "spotifast/settings.json" = {
              source = (json.generate "spotifast-config.json" cfg.settings);
              force = true;
            };
          };
        };
      };
  };
}
