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
      let
        separate = lib.concatStringsSep ",";
      in
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

              corner_bottom_left =
                [
                  "version"
                ]
                |> separate;

              corner_bottom_right =
                [
                  "labels"
                ]
                |> separate;

              corner_top_left =
                [
                  "shutdown"
                  "restart"
                  "britup"
                  "britdown"
                  "password"
                  "battery"
                ]
                |> separate;

              corner_top_right =
                [
                  "clock"
                  "capslock"
                ]
                |> separate;
            };
          };
        };
      };
  };
}
