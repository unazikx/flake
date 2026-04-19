{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.ytsub;

  json = pkgs.formats.json { };
in

{
  options = {
    programs.ytsub = {
      enable = lib.mkEnableOption "hyprism";

      package = lib.mkOption {
        type = lib.types.package;
        default = pkgs.own.hyprism;
      };

      settings = lib.mkOption {
        type = lib.types.json;
        default = { };
      };
    };
  };

  config = {
    home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

    xdg.dataHome = {
      "HyPrism/config.json" = lib.mkIf (cfg.settings != { }) {
        source = json.generate "config.json" cfg.settings;
        force = false;
      };
    };
  };
}
