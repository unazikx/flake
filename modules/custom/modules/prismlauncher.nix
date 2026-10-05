{
  zen.custom.prismlauncher = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.prismlauncher;
        json = pkgs.formats.json { };
      in
      {
        imports = lib.singleton (
          lib.stylix.mkTarget
            {
              name = "prismlauncher";
              humanName = "PrismLauncher";
            }
            {
              config = [
                ({ colors }: {
                  programs.prismlauncher = {
                    settings = {
                      ApplicationTheme = "stylix";
                    };

                    themes.stylix.theme = {
                      name = "Stylix";
                      widgets = "Fusion";

                      colors = {
                        AlternateBase = colors.base01;
                        Base = colors.base00;
                        BrightText = colors.base08;
                        Button = colors.base01;
                        ButtonText = colors.base05;
                        Highlight = colors.base02;
                        HighlightedText = colors.base05;
                        Link = colors.base0D;
                        Text = colors.base05;
                        ToolTipBase = colors.base00;
                        ToolTipText = colors.base05;
                        Window = colors.base00;
                        WindowText = colors.base05;
                        fadeAmount = 0.5;
                        fadeColor = colors.base02;
                      };

                      logColors = {
                        Debug = colors.base0B;
                        DebugHighlight = colors.base03;
                        Error = colors.base08;
                        ErrorHighlight = colors.base03;
                        Fatal = colors.base08;
                        FatalHighlight = colors.base00;
                        Launcher = colors.base0D;
                        LauncherHighlight = colors.base03;
                        Message = colors.base05;
                        MessageHighlight = colors.base02;
                        Warning = colors.base0A;
                        WarningHighlight = colors.base03;
                      };
                    };
                  };
                })
              ];
            }
        );

        options = {
          programs.blockbench = {
            enable = lib.mkEnableOption "Blockbench, ...";

            package = lib.mkPackageOption pkgs "blockbench" {
              nullable = true;
            };

            settings = lib.mkOption {
              type = json.type;
              default = { };
              description = "Blockbench configuration options written to XDG config in JSON format.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.configFile = {
            "Blockbench/stylix.bbtheme".source = lib.mkIf (cfg.settings != { }) (
              json.generate "blockbench-theme.json" cfg.settings
            );
          };
        };
      };
  };
}
