{
  ...
}:

{
  zen.services.greetd = {
    description = ''
      selector for DE and WM
      change user and shutdown/reboot
    '';

    nixos =
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
            default_session.command =
              let
                desktops = config.services.displayManager.sessionData.desktops;
                sessions = "${desktops}/share/xsessions:${desktops}/share/wayland-sessions";
                colorScheme = (
                  lib.concatStringsSep ";" [
                    "border=magenta"
                    "text=cyan"
                    "prompt=green"
                    "time=red"
                    "action=blue"
                    "button=yellow"
                    "container=black"
                    "input=red"
                  ]
                );
              in
              lib.concatStringsSep " " [
                (lib.getExe pkgs.tuigreet)

                "--sessions"
                sessions

                "--asterisks"
                "--time"

                "--remember"
                "--remember-session"

                "--theme"
                colorScheme
              ];
          };
        };

        security.pam.services.greetd = {
          fprintAuth = true;
        };
      };
  };
}
