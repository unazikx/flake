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

                "XF86AudioRaiseVolume" = "volume-up";
                "XF86AudioLowerVolume" = "volume-down";
                "XF86AudioMute" = "volume-mute";

                "XF86MonBrightnessUp" = "brightness-up";
                "XF86MonBrightnessDown" = "brightness-down";

                "XF86AudioMicMute" = "mic-mute";

                "XF86Display" = "caffeine-toggle";
                "XF86NotificationCenter" = "panel-toggle clipboard";
                "XF86Favorites" = "wallpaper-random";
              }
            )
          ];
        };
      };
  };
}
