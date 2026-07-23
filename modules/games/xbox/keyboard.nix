{
  zen,
  ...
}:

{
  zen.games.xbox.keyboard = {
    description = ''
      module for use xbox controller as keyboard

      reference:
      https://github.com/barsikus007/config/blob/master/nix/modules/hardware/gamepad-kbd.nix
    '';

    includes = [
      zen.games.xbox.driver
      zen.hardware.bluetooth
    ];

    nixos =
      {
        self',
        pkgs,
        lib,
        ...
      }:
      {
        hardware.uinput.enable = true;

        environment.systemPackages = [
          self'.legacyPackages.xbox.gamepad-kbd-toggle
          self'.legacyPackages.xbox.gamepad-rumble
        ];

        systemd.user = {
          services.gamepad-kbd = {
            description = "Gamepad-as-keyboard remapper (evsieve)";
            partOf = [ "graphical-session.target" ];
            after = [ "graphical-session.target" ];
            startLimitIntervalSec = 30;
            startLimitBurst = 3;
            serviceConfig = {
              Type = "simple";
              ExecStart = lib.getExe self'.legacyPackages.xbox.gamepad-kbd;
              Restart = "on-failure";
              RestartSec = 2;
            };
          };

          services.gamepad-kbd-watch = {
            description = "Gamepad Menu+View chord watcher -> toggle keyboard mode";
            wantedBy = [ "graphical-session.target" ];
            partOf = [ "graphical-session.target" ];
            after = [ "graphical-session.target" ];
            serviceConfig = {
              Type = "simple";
              ExecStart = lib.getExe self'.legacyPackages.xbox.gamepad-kbd-watch;
              Restart = "always";
              RestartSec = 3;
            };
          };
        };

        services.udev.extraRules = ''
          KERNEL=="hidraw*", SUBSYSTEM=="hidraw", KERNELS=="*045E:028E*", OWNER:="root", GROUP:="root", MODE:="0000", RUN+="${lib.getExe' pkgs.acl "setfacl"} -b /dev/%k"
          SUBSYSTEM=="input", KERNEL=="event*", ATTRS{name}=="Xbox Wireless Controller", ATTRS{phys}=="?*", SYMLINK+="input/xbox_gamepad"
        '';
      };

    user =
      {
        ...
      }:
      {
        extraGroups = [
          "uinput"
          "input"
        ];
      };
  };
}
