{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.gale;
in

{
  options = {
    programs.gale = {
      enable = lib.mkEnableOption "Gale, a terminal-based image viewer";

      package = lib.mkPackageOption pkgs "gale" {
        nullable = true;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];
  };
}
