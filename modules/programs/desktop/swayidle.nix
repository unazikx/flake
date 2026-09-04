{
  ...
}:

{
  zen.programs.desktop.swayidle = {
    description = ''
      idle ivents for swaywm
    '';

    homeManager =
      {
        ...
      }:
      {
        services.swayidle = {
          enable = true;

          timeouts =
            let
              minute = 60;
            in
            [
              {
                timeout = minute * 5;
                command = "swaylock";
              }
              {
                timeout = (minute * 5) + 30;
                command = "noctalia msg dpms-off";
                resumeCommand = "noctalia msg dpms-on";
              }
              {
                timeout = minute * 30;
                command = "systemctl suspend-then-hibernate";
              }
            ];
        };
      };
  };
}
