{
  ...
}:

{
  zen.programs.desktop.sway.binds-noctalia = {
    homeManagerNixos =
      {
        lib,
        config,
        ...
      }:
      let
        cfg = config.wayland.windowManager.sway;
        ipc = "noctalia msg";
      in
      {
        wayland.windowManager.sway.config = {
          keybindings = lib.mkMerge [
            (lib.concatMapAttrs
              (key: command: {
                "${cfg.config.modifier}+${key}" = "exec ${ipc} ${command}";
              })
              {
                "tab" = "panel-toggle launcher";
                "shift+tab" = "panel-toggle clipboard";

                "space" = "dock-toggle";
                "escape" = "panel-toggle session";

                "w" = "window-switcher";
                "z" = "panel-toggle launcher /emo";
              }
            )

            {
              "print" = "screenshot-region";
              "print+shift" = "screenshot-fullscreen";
            }
          ];
        };
      };
  };
}
