{
  zen.custom.obs-studio = {
    homeManager =
      {
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.obs-studio;
      in
      {
        options = {
          programs.obs-studio = {
            theme = {
              obt = lib.mkOption {
                type = lib.types.nullOr lib.types.str;
                default = null;
                description = "OBS Studio theme settings written to obt file.";
              };

              ovt = lib.mkOption {
                type = lib.types.nullOr lib.types.str;
                default = null;
                description = "OBS Studio theme settings written to ovt file.";
              };
            };
          };
        };

        config = lib.mkIf cfg.enable {
          xdg.configFile = lib.mkIf (config ? stylix && config.stylix.targets.obs-studio.enable) {
            "obs-studio/themes/stylix.obt".text = cfg.theme.obt;
            "obs-studio/themes/stylix.ovt".text = cfg.theme.ovt;
          };
        };
      };
  };
}
