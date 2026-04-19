{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.ytsub;

  toml = pkgs.formats.toml { };
in

{
  options = {
    programs.ytsub = {
      enable = lib.mkEnableOption "ytsub";

      package = lib.mkPackageOption pkgs "ytsub" {
        nullable = true;
      };

      settings = lib.mkOption {
        inherit (toml) type;
        default = { };
      };
    };
  };

  config = {
    home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

    xdg.configFile."ytsub/config.toml" = lib.mkIf (cfg.settings != { }) {
      source = toml.generate "config.toml" cfg.settings;
    };
  };
}
