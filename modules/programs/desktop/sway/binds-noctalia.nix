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
                "Tab" = "panel-toggle launcher";
                "Shift+Tab" = "panel-toggle clipboard";

                "Space" = "dock-toggle";
                "Escape" = "panel-toggle session";

                "W" = "window-switcher";
                "Z" = "panel-toggle launcher /emo";
              }
            )

            (lib.concatMapAttrs
              (key: command: {
                "${key}" = "exec ${ipc} ${command}";
              })
              {
                "Print" = "screenshot-region";
                "Print+Shift" = "screenshot-fullscreen";
              }
            )
          ];
        };
      };
  };
}
