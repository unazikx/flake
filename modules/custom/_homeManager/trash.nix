{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.trash;
in

{
  options = {
    programs.trash = {
      enable = lib.mkEnableOption "Trash, utility for trashing items instead deleting";

      package = lib.mkPackageOption pkgs "trash-cli" {
        nullable = true;
      };

      replaceRm = lib.mkEnableOption "register rm as alias for trash-put";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

    home.shellAliases = lib.mkIf cfg.replaceRm {
      rm = lib.getExe' pkgs.trash-cli "trash-put";
    };
  };
}
