{
  zen.custom.cpupower-gui = {
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      let
        cfg = config.services.cpupower-gui;
      in
      {
        disabledModules = [
          "services/desktops/cpupower-gui.nix"
        ];

        options.services.cpupower-gui = {
          enable = lib.mkEnableOption "CpuPower-GUI";

          package = lib.mkPackageOption pkgs "cpupower-gui" {
            nullable = true;
          };
        };

        config = lib.mkIf cfg.enable {
          environment.systemPackages = [ cfg.package ];
          services.dbus.packages = [ cfg.package ];

          systemd.user = {
            services.cpupower-gui-user = {
              description = "Apply cpupower-gui config at user login";
              wantedBy = [ "graphical-session.target" ];
              serviceConfig = {
                Type = "oneshot";
                ExecStart = "${cfg.package}/bin/cpupower-gui config";
              };
            };
          };

          systemd.services = {
            cpupower-gui = {
              description = "Apply cpupower-gui config at boot";
              wantedBy = [ "multi-user.target" ];
              serviceConfig = {
                Type = "oneshot";
                ExecStart = "${cfg.package}/bin/cpupower-gui config";
              };
            };

            cpupower-gui-helper = {
              description = "cpupower-gui system helper";
              aliases = [ "dbus-org.rnd2.cpupower_gui.helper.service" ];
              serviceConfig = {
                Type = "dbus";
                BusName = "org.rnd2.cpupower_gui.helper";
                ExecStart = "${cfg.package}/lib/cpupower-gui/cpupower-gui-helper";
              };
            };
          };
        };
      };
  };
}
