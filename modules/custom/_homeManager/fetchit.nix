{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.fetchit;
in

{
  options = {
    programs.fetchit = {
      enable = lib.mkEnableOption "fetchit, a simple fetcher";

      package = lib.mkPackageOption pkgs "fetchit" {
        nullable = true;
      };

      settings = lib.mkOption {
        type = lib.types.nullOr lib.types.lines;
        default = null;
        description = "fetchit configuration options written to XDG config in raw Lua format.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

    xdg.configFile = {
      "fetchit/init.lua".source = lib.mkIf (cfg.settings != null) (
        pkgs.writeText "fetchit-init.lua" cfg.settings
      );
    };
  };
}
