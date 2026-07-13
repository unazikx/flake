{
  ...
}:

{
  zen.hardware.sound.rtkit = {
    description = ''
      power control
    '';

    nixos =
      {
        ...
      }:
      {
        security.rtkit.enable = true;
      };
  };
}
