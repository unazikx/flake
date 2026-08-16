{
  zen.custom.viu = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.viu;
        toml = pkgs.formats.toml { };
      in
      {
        options = {
          programs.viu = {
            enable = lib.mkEnableOption "Viu, a terminal image viewer with kitty and sixel support";

            package = lib.mkPackageOption pkgs "viu" {
              nullable = true;
            };

            settings = lib.mkOption {
              type = toml.type;
              default = { };
              description = "Viu configuration options written to XDG config in TOML format.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.configFile = {
            "viu/config.toml".source = lib.mkIf (cfg.settings != { }) (
              toml.generate "viu-config.toml" cfg.settings
            );
          };
        };
      };
  };
}
