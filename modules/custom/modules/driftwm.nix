{
  zen.custom.driftwm = {
    nixos =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.driftwm;
      in
      {
        options = {
          programs.driftwm = {
            enable = lib.mkEnableOption "driftwm, a trackpad-first infinite canvas Wayland compositor";

            package = lib.mkPackageOption pkgs "driftwm" {
              nullable = true;
            };
          };
        };

        config = lib.mkIf cfg.enable {
          environment.systemPackages = [
            cfg.package
          ]
          ++ lib.optional config.programs.xwayland.enable pkgs.xwayland-satellite;

          programs.xwayland.enable = lib.mkDefault true;

          services = {
            displayManager.sessionPackages = lib.mkIf (cfg.package != null) [ cfg.package ];
            gnome.gnome-keyring.enable = lib.mkDefault true;
            graphical-desktop.enable = lib.mkDefault true;
          };

          security = {
            polkit.enable = lib.mkDefault true;
            pam.services.swaylock = lib.mkDefault { };
          };

          systemd = {
            packages = [ cfg.package ];
            user.services.driftwm = {
              restartIfChanged = false;
              enableDefaultPath = false;
            };
          };

          xdg.portal = {
            enable = lib.mkDefault true;
            configPackages = lib.mkDefault [ cfg.package ];
            extraPortals = lib.mkDefault [
              pkgs.xdg-desktop-portal-gtk
              pkgs.xdg-desktop-portal-wlr
            ];
          };
        };
      };

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
