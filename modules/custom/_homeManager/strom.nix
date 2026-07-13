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
      enable = lib.mkEnableOption "Strom, a Steam ROM Manager for adding emulated games to Steam";

      games = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [ ];
        description = "List of emulated games to add to Steam via Strom.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.mkIf (cfg.games != [ ]) cfg.games;
  };
}
