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
          services.logind.settings.Login = lib.mkMerge [
            {
              "HandleLidSwitch" = "suspend";
              "HandlePowerKeyLongPress" = "reboot";
              "HandlePowerKey" = "suspend";
            }
            (lib.genAttrs [
              "HandleLidSwitchExternalPower"
              "HandleLidSwitchDocked"
            ] (_: "ignore"))
          ];
        };
    };
}
