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
      enable = lib.mkEnableOption "Ytsub, a beautiful youtube downloader/player tui";

      package = lib.mkPackageOption pkgs "ytsub" {
        nullable = true;
      };

      settings = lib.mkOption {
        type = toml.type;
        default = { };
        description = "Ytsub configuration options written to XDG config in TOML format.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

    xdg.configFile = {
      "ytsub/config.toml".source = lib.mkIf (cfg.settings != { }) (
        toml.generate "ytsub-config.toml" cfg.settings
      );
    };
  };
}
