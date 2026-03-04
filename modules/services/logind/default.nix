# INFO:
# actions when lid and physical keys

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          ...
        }:
        {
          services.logind.settings.Login =
            (lib.genAttrs [
              "HandleLidSwitchExternalPower"
              "HandleLidSwitchDocked"
            ] (_: "ignore"))
            // {
              "HandleLidSwitch" = "suspend";
              HandlePowerKeyLongPress = "reboot";
              HandlePowerKey = "suspend";
            };
        };
    };
}
