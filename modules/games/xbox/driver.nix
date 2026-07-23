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
        ...
      }:
      {
        hardware.xone.enable = true;
        hardware.xpadneo.enable = true;
      };
  };
}
