{
  zen.custom.halley = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.halley;
      in
      {
        options = {
          programs.halley = {
            enable = lib.mkEnableOption "Halley";

            package = lib.mkPackageOption pkgs "halley" {
              nullable = true;
            };

            settings = lib.mkOption {
              type = lib.types.nullOr lib.types.str;
              default = "";
              description = "Halley configuration options written to XDG config in RUNE format (strings).";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.configFile = {
            "halley/halley.rune".text = lib.mkIf (cfg.settings != null) cfg.settings;
          };
        };
      };
  };
}
