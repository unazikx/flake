{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.blockbench;
  json = pkgs.formats.json { };
in

{
  imports = lib.singleton (
    lib.stylix.mkTarget
      {
        name = "blockbench";
        humanName = "Blockbench";
      }
      {
        config = [
          ({ colors, fonts }: {
            programs.blockbench.settings = {
              name = "Base16";
              author = "Stylix";
              main_font = fonts.sansSerif.name;
              headline_font = fonts.sansSerif.name;
              code_font = fonts.monospace.name;
              colors = {
                ui = colors.withHashtag.base00;
                back = colors.withHashtag.base00;
                dark = colors.withHashtag.base00;
                border = colors.withHashtag.base02;
                selected = colors.withHashtag.base03;
                button = colors.withHashtag.base02;
                bright_ui = colors.withHashtag.base00;
                accent = colors.withHashtag.base0D;
                frame = colors.withHashtag.base00;
                text = colors.withHashtag.base06;
                light = colors.withHashtag.base07;
                accent_text = colors.withHashtag.base00;
                bright_ui_text = colors.withHashtag.base06;
                subtle_text = colors.withHashtag.base05;
                grid = colors.withHashtag.base0E;
                wireframe = colors.withHashtag.base0D;
                checkerboard = colors.withHashtag.base02;
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
}
