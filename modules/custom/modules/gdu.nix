{
  zen.custom.gdu = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.gdu;
      in
      {
        options = {
          programs.gdu = {
            enable = lib.mkEnableOption "GDU (Go Disk Usage), a fast TUI disk usage analyzer";

            package = lib.mkPackageOption pkgs "gdu" {
              nullable = true;
            };

            settings = lib.mkOption {
              type = lib.types.nullOr lib.types.str;
              default = null;
              description = "Content for ~/.gdu.yaml, written when non-null.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          home.file = {
            ".gdu.yaml".text = lib.mkIf (cfg.settings != null) cfg.settings;
          };
        };
      };
  };
}
