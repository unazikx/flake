{
  ...
}:

{
  zen.hardware.boot.systemd-boot = {
    description = ''
      program that start systems
      and provides generations
    '';

    nixos =
      {
        lib,
        ...
      }:
      {
        boot.loader = {
          timeout = lib.mkForce 1;
          efi.canTouchEfiVariables = true;

          systemd-boot = {
            enable = true;

            configurationLimit = 4;
          };
        };
      };
  };
}
