{
  zen,
  ...
}:

{
  zen.games.xbox.driver = {
    description = ''
      drivers for use xbox controller in linux

      xpad-noone: for usb
      xpadneo: for bluetooth
    '';

    includes = [
      zen.hardware.bluetooth
    ];

    nixos =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        hardware.xpad-noone.enable = true;
        boot.extraModulePackages = [
          config.boot.kernelPackages.xone
        ];

        hardware.xpadneo.enable = true;

        services.udev.extraRules = ''
          KERNEL=="hidraw*", SUBSYSTEM=="hidraw", KERNELS=="*045E:028E*", OWNER:="root", GROUP:="root", MODE:="0000", RUN+="${lib.getExe' pkgs.acl "setfacl"} -b /dev/%k"
          SUBSYSTEM=="input", KERNEL=="event*", ATTRS{name}=="Xbox Wireless Controller", ATTRS{phys}=="?*", SYMLINK+="input/xbox_gamepad"
        '';
      };
  };
}
