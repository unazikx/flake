{
  ...
}:

{
  zen.programs.desktop.sway.binds = {
    homeManagerNixos =
      {
        lib,
        config,
        ...
      }:
      let
        cfg = config.wayland.windowManager.sway;
        wayshot = config.programs.wayshot;
      in
      {
        wayland.windowManager.sway.config = {
          keybindings = lib.mkMerge [
            (lib.concatMapAttrs
              (key: program: {
                "${cfg.config.modifier}+${key}" = "exec ${program}";
              })
              {
                "tab" = "tofi-drun | xargs swaymsg exec --";
                "space" = "vicinae toggle";
              }
            )

            (
              let
                screenshot = "exec ${lib.getExe wayshot.package} ${config.xdg.userDirs.pictures}";
              in
              {
                "Print" = "${screenshot} -g";
                "Print+Shift" = "${screenshot}";
              }
            )
          ];
        };
      };
  };
}
