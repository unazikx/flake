{
  lib,
  config,
  ...
}:

let
  cfg = config.programs.strom;
in

{
  options = {
    programs.strom = {
      enable = lib.mkEnableOption "hyprism";

      games = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [ ];
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.games ];
  };
}
