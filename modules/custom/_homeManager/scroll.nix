{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.scroll;
in

{
  options = {
    programs.scroll = {
      enable = lib.mkEnableOption "Scroll";

      package = lib.mkPackageOption pkgs "scroll" {
        nullable = true;
      };

      settings = lib.mkOption {
        type = lib.types.nullOr lib.types.lines;
        default = null;
        description = "Scroll configuration options written to XDG config in raw format.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

    xdg.configFile = {
      "scroll/config".text = lib.mkIf (cfg.settings != null) cfg.settings;
    };
  };
}
