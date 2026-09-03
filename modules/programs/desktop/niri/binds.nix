{
  ...
}:

{
  zen.programs.desktop.niri.binds = {
    homeManager =
      {
        lib,
        config,
        ...
      }:
      {
        programs.niri = {
          settings.binds =
            let
              actions = config.lib.niri.actions;

              bind = name: action: {
                inherit
                  name
                  ;
                value = {
                  inherit
                    action
                    ;
                };
              };
            in
            (lib.listToAttrs (
              # programs
              lib.flatten [
                # utils
                (bind "Mod+Tab" (actions.spawn-sh "noctalia ipc panel-toggle launcher"))
                (bind "Mod+Shift+Tab" (actions.spawn-sh "noctalia ipc panel-toggle clipboard"))

                (bind "Mod+W" (actions.spawn-sh "noctalia ipc window-switcher"))
                (bind "Mod+Alt+Space" (actions.spawn-sh "noctalia ipc dock-toggle"))

                (bind "Mod+Escape" (actions.spawn-sh "noctalia ipc panel-toggle session"))
                (bind "Mod+Shift+Escape" (actions.spawn-sh "noctalia ipc session lock"))

                (bind "Mod+Return" (actions.spawn-sh "footclient"))
                (bind "Mod+Shift+Return" (actions.spawn-sh "footclient -a=foot_small"))

                # main actions
                (bind "Mod+Shift+Slash" actions.show-hotkey-overlay) # help

                (bind "Mod+Q" actions.close-window)

                (bind "Mod+C" actions.center-window)
                (bind "Mod+Shift+C" actions.center-column)

                (bind "Mod+Space" actions.toggle-overview)
                (bind "Mod+Shift+Space" actions.toggle-window-floating)

                (bind "Mod+F" actions.fullscreen-window)
                (bind "Mod+Shift+F" actions.maximize-column)

                (bind "Mod+S" actions.switch-preset-column-width)
                (bind "Mod+Shift+S" actions.switch-preset-window-height)

                (bind "Mod+Minus" (actions.set-column-width "-10%"))
                (bind "Mod+Equal" (actions.set-column-width "+10%"))
                (bind "Mod+Shift+Minus" (actions.set-window-height "-10%"))
                (bind "Mod+Shift+Equal" (actions.set-window-height "+10%"))

                (bind "Mod+Comma" actions.consume-window-into-column)
                (bind "Mod+Period" actions.expel-window-from-column)

                # windows manipukating
                (bind "Mod+H" actions.focus-column-left)
                (bind "Mod+J" actions.focus-window-or-workspace-down)
                (bind "Mod+K" actions.focus-window-or-workspace-up)
                (bind "Mod+L" actions.focus-column-right)

                (bind "Mod+Left" actions.focus-column-left)
                (bind "Mod+Down" actions.focus-window-or-workspace-down)
                (bind "Mod+Up" actions.focus-window-or-workspace-up)
                (bind "Mod+Right" actions.focus-column-right)

                (bind "Mod+Shift+H" actions.move-column-left)
                (bind "Mod+Shift+J" actions.move-column-to-workspace-down)
                (bind "Mod+Shift+K" actions.move-column-to-workspace-up)
                (bind "Mod+Shift+L" actions.move-column-right)

                (bind "Mod+Shift+Left" actions.move-column-left)
                (bind "Mod+Shift+Down" actions.move-column-to-workspace-down)
                (bind "Mod+Shift+Up" actions.move-column-to-workspace-up)
                (bind "Mod+Shift+Right" actions.move-column-right)

                (bind "Mod+Ctrl+J" actions.move-window-down-or-to-workspace-down)
                (bind "Mod+Ctrl+K" actions.move-window-up-or-to-workspace-up)

                (bind "Mod+Ctrl+Down" actions.move-window-down-or-to-workspace-down)
                (bind "Mod+Ctrl+Up" actions.move-window-up-or-to-workspace-up)

                # screenshots
                (bind "Print" (actions.spawn-sh "noctalia ipc screenshot-region"))
                (bind "Shift+Print" (actions.spawn-sh "noctalia ipc screenshot-fullscreen"))

                # applications
                [
                  (bind "Mod+V" (actions.spawn-sh "AyuGram"))
                  (bind "Mod+Shift+V" (actions.spawn-sh "equibop"))

                  (bind "Mod+B" (actions.spawn-sh "qutebrowser"))
                  (bind "Mod+Shift+B" (actions.spawn-sh "librewolf"))

                  (bind "Mod+M" (actions.spawn-sh "spotify"))
                  (bind "Mod+Shift+M" (actions.spawn-sh "obsidian"))
                ]
              ]
            ));
        };
      };
  };
}
