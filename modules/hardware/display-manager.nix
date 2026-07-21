{
  zen,
  ...
}:

{
  zen.hardware.display-manager = {
    description = ''
      service for change de/wm
      and toggle between users
    '';

    exclude = [
      zen.services.greetd
    ];

    nixos =
      {
        lib,
        ...
      }:
      {
        services.displayManager = {
          enable = true;

          ly = {
            enable = true;
            x11Support = false;

            settings = {
              animate = true;
              animation = "matrix";
              bigclock = "en";
              bigclock_12hr = false;

              corner_bottom_left = lib.concatStringsSep "," [
                "version"
              ];

              corner_bottom_right = lib.concatStringsSep "," [
                "labels"
              ];

              corner_top_left = lib.concatStringsSep "," [
                "shutdown"
                "restart"
                "britup"
                "britdown"
                "password"
                "battery"
              ];

              corner_top_right = lib.concatStringsSep "," [
                "clock"
                "capslock"
              ];
            };
          };
        };
      };
  };
}
