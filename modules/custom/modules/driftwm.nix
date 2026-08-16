{
  zen.custom.driftwm = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.driftwm;
        toml = pkgs.formats.toml { };
      in
      {
        options = {
          programs.driftwm = {
            enable = lib.mkEnableOption "DriftWM";

            package = lib.mkPackageOption pkgs "driftwm" {
              nullable = true;
            };

            settings = lib.mkOption {
              type = toml.type;
              default = { };
              description = "DriftWM configuration options written to XDG config in TOML format.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.configFile = {
            "driftwm/config.toml".source = lib.mkIf (cfg.settings != { }) (
              toml.generate "driftwm-config.toml" cfg.settings
            );
          };
        };
      };
  };
}
