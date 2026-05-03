# INFO:
# selector for DE and WM
# change user and shutdown/reboot

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
          services.greetd = {
            enable = true;

            useTextGreeter = true;
            greeterManagesPlymouth = true;

            settings = {
              default_session = {
                user = lib.userName;
                command = lib.concatStringsSep " " [
                  (lib.getExe pkgs.tuigreet)
                  "--asterisks"
                  "--remember"
                  "--remember-session"
                  "--time"
                  "--theme"
                  (lib.concatStringsSep ";" [
                    "border=magenta"
                    "text=cyan"
                    "prompt=green"
                    "time=red"
                    "action=blue"
                    "button=yellow"
                    "container=black"
                    "input=red"
                  ])
                ];
              };

              initial_session = {
                user = lib.userName;
                command = lib.getExe' config.hm.programs.niri.package "niri-session";
              };
            };
          };
        };
    };
}
