{
  zen.custom.clapboard = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.services.clapboard;
        toml = pkgs.formats.toml { };
      in
      {
        options = {
          services.clapboard = {
            enable = lib.mkEnableOption "Clapboard, a modern clipboard manager";

            package = lib.mkPackageOption pkgs "clapboard" {
              nullable = true;
            };

            persist = lib.mkOption {
              type = lib.types.bool;
              default = true;
              description = "Enable wl-clip-persist for Wayland clipboard persistence.";
            };

            mode = lib.mkOption {
              type = lib.types.nullOr lib.types.str;
              default = null;
              description = "Whats type clipboard would persist.";
            };

            settings = lib.mkOption {
              type = lib.types.attrs;
              default = { };
              description = "Clapboard configuration written to config.toml.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.configFile."clapboard/config.toml".source = lib.mkIf (cfg.settings != { }) (
            toml.generate "clapboard-config.toml" cfg.settings
          );

          services.wl-clip-persist = lib.mkIf cfg.persist {
            enable = true;
          };

          systemd.user.services.clapboard = {
            Unit = {
              Description = cfg.package.meta.description;
              After = [ "graphical-session.target" ];
            };

            Service = {
              ExecStart = "${lib.getExe cfg.package} --record ${toString cfg.mode}";
              Type = "simple";
              KillMode = "process";
              Restart = "on-failure";
              RestartSec = 5;
            };

            Install.WantedBy = [ "graphical-session.target" ];
          };
        };
      };
  };
}
