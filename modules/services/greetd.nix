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
        ...
      }:
      {
        services.greetd = {
          enable = true;

          useTextGreeter = true;
          greeterManagesPlymouth = true;

          settings = {
            default_session.command = lib.concatStringsSep " " [
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
        };

        security.pam.services.greetd = {
          fprintAuth = true;
        };
      };
  };
}
