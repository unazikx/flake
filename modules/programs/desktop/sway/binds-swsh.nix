{
  ...
}:

{
  zen.programs.desktop.sway.binds-swsh = {
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
            (
              {
                "Tab" = "tofi-drun | xargs swaymsg exec --";
                "Space" = "vicinae toggle";
              }
              |> lib.concatMapAttrs (
                key: program: {
                  "${cfg.config.modifier}+${key}" = "exec ${program}";
                }
              )
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
