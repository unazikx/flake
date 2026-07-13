{
  ...
}:

{
  zen.services.logind = {
    description = ''
      actions when lid and physical keys
    '';

    nixos =
      {
        ...
      }:
      {
        services.logind.settings.Login = {
          "HandleLidSwitch" = "suspend";
          "HandlePowerKeyLongPress" = "reboot";
          "HandlePowerKey" = "suspend";
          "HandleLidSwitchExternalPower" = "ignore";
          "HandleLidSwitchDocked" = "ignore";
        };
      };
  };
}
