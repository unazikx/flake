{
  ...
}:

{
  zen.hardware.power = {
    description = ''
      power control
    '';

    nixos =
      {
        ...
      }:
      {
        services = {
          upower.enable = true;
        };

        powerManagement = {
          enable = true;
          powertop.enable = true;
          cpuFreqGovernor = "powersave";
        };
      };
  };
}
