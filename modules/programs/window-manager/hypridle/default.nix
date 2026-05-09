# # WARN:
# unmaintained
# i will never use it again
#
# INFO:
# executes on timer

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        {
          hm.services.hypridle = {
            enable = true;

            settings = {
              general = {
                ignore_dbus_inhibit = false;

                after_sleep_cmd = "hyprctl dispatch dpms on";
                before_sleep_cmd = "loginctl lock-session";
              }
              // (lib.optionalAttrs config.hm.programs.hyprlock.enable {
                lock_cmd = "pidof hyprlock || hyprlock";
              });

              listener = [
                {
                  timeout = 600;
                  on-timeout = "${lib.getExe pkgs.brightnessctl} set 10%";
                  on-resume = "${lib.getExe pkgs.brightnessctl} set 100%";
                }

                {
                  timeout = 720;
                  on-timeout = "hyprctl dispatch dpms off";
                  on-resume = "hyprctl dispatch dpms on";
                }
              ];
            };
          };
        };
    };
}
