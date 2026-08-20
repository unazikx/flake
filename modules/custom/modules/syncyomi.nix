{
  zen.custom.syncyomi = {
    nixos =
      {
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.syncyomi;
      in
      {
        options = {
          programs.syncyomi = {
            enable = lib.mkEnableOption "Syncyomi, sync server for Mihon forks";
          };
        };

        config = lib.mkIf cfg.enable { };
      };
  };
}
