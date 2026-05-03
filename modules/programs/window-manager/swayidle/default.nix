# INFO:
# idle ivents for swaywm

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          ...
        }:
        {
          hm.services.swayidle = {
            enable = true;
            systemdTargets = [ "sway-session.target" ];

            events = {
              lock = "pidof swaylock || swaylock -defF";
              before-sleep = "loginctl lock-session";
              after-resume = ''swaymsg "output * dpms on"'';
            };

            timeouts =
              let
                minute = 60;
              in
              [
                {
                  timeout = minute * 40;
                  command = ''swaymsg "output * dpms off"'';
                  resumeCommand = ''swaymsg "output * dpms on"'';
                }
                {
                  timeout = minute * 50;
                  command = "swaylock";
                }
                {
                  timeout = minute * 60;
                  command = "systemctl suspend";
                }
              ];
          };
        };
    };
}
