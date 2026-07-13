{
  ...
}:

{
  zen.programs.desktop.niri.binds = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        programs.niri = {
          settings.binds =
            let
              actions = config.lib.niri.actions;

              m = "Mod";
              s = "Shift";
              a = "Alt";
              c = "Ctrl";

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

              spawnMsg = cmd: actions.spawn-sh ("niri msg action " + cmd);

              dms = config.programs.dank-material-shell;
            in
            (lib.listToAttrs (
              # programs
              lib.flatten [
                (bind "${m}+Tab" (
                  actions.spawn-sh (
                    if dms.enable then
                      "dms ipc spotlight open"
                    else
                      "bash -c tofi-drun | xargs niri msg action spawn --"
                  )
                ))

                (bind "${m}+${s}+Tab" (
                  actions.spawn-sh (if dms.enable then "dms ipc clipboard open" else (lib.getExe pkgs.clapboard))
                ))

                (bind "${m}+Return" (actions.spawn-sh "footclient"))
                (bind "${m}+${s}+Return" (actions.spawn-sh "footclient -a=foot_small"))
                (bind "${m}+${a}+Return" (
                  actions.spawn-sh (
                    lib.getExe (
                      pkgs.writeShellScriptBin "niri-pid-kill" ''
                        data=$(niri msg pick-window)
                        pid=$(awk '/PID:/ {print $2}' <<< "$data")
                        [ -n "$pid" ] && kill "$pid"
                      ''
                    )
                  )
                ))

                (bind "${m}+V" (actions.spawn-sh "AyuGram"))
                (bind "${m}+${s}+V" (actions.spawn-sh "equibop"))

                (bind "${m}+B" (actions.spawn-sh "qutebrowser"))
                (bind "${m}+${s}+B" (actions.spawn-sh "librewolf"))

                (bind "${m}+M" (actions.spawn-sh "spotify"))
                (bind "${m}+${s}+M" (actions.spawn-sh "obsidian"))

                # main actions
                (bind "${m}+${s}+Slash" actions.show-hotkey-overlay) # help

                (bind "${m}+Q" actions.close-window)

                (bind "${m}+C" actions.center-window)
                (bind "${m}+${s}+C" actions.center-column)

                (bind "${m}+Space" actions.toggle-overview)
                (bind "${m}+${a}+Space" actions.toggle-window-floating)
                (bind "${m}+${s}+Space" (
                  actions.spawn-sh (
                    lib.getExe (
                      pkgs.writeShellScriptBin "niri-view-window-title" ''
                        cmd=$(niri msg pick-window)
                        title=$(awk -F'"' '/Title:/ {print $2}' <<< "$cmd")
                        app_id=$(awk -F'"' '/App ID:/ {print $2}' <<< "$cmd")
                        [ -n "$title" ] && ${lib.getExe pkgs.libnotify} \
                          -t 1000 -a niri-title "$title - $app_id"
                      ''
                    )
                  )
                ))

                (bind "${m}+F" actions.fullscreen-window)
                (bind "${m}+${s}+F" actions.maximize-column)

                # (bind "Print" (spawn "niri" "msg" "action" "screenshot-screen"))
                # (bind "${s}+Print" screenshot-window)
                # https://github.com/sodiboo/niri-flake/issues/1380
                # fuck it, i w'ont to fuck with this

                (bind "${m}+S" actions.switch-preset-column-width)
                (bind "${m}+${s}+S" actions.switch-preset-window-height)

                (bind "${m}+Minus" (actions.set-column-width "-10%"))
                (bind "${m}+Equal" (actions.set-column-width "+10%"))
                (bind "${m}+${s}+Minus" (actions.set-window-height "-10%"))
                (bind "${m}+${s}+Equal" (actions.set-window-height "+10%"))

                (bind "${m}+Comma" actions.consume-window-into-column)
                (bind "${m}+Period" actions.expel-window-from-column)

                # windows manipukating
                (bind "${m}+H" actions.focus-column-left)
                (bind "${m}+J" actions.focus-window-or-workspace-down)
                (bind "${m}+K" actions.focus-window-or-workspace-up)
                (bind "${m}+L" actions.focus-column-right)

                (bind "${m}+Left" actions.focus-column-left)
                (bind "${m}+Down" actions.focus-window-or-workspace-down)
                (bind "${m}+Up" actions.focus-window-or-workspace-up)
                (bind "${m}+Right" actions.focus-column-right)

                (bind "${m}+${s}+H" actions.move-column-left)
                (bind "${m}+${s}+J" actions.move-column-to-workspace-down)
                (bind "${m}+${s}+K" actions.move-column-to-workspace-up)
                (bind "${m}+${s}+L" actions.move-column-right)

                (bind "${m}+${s}+Left" actions.move-column-left)
                (bind "${m}+${s}+Down" actions.move-column-to-workspace-down)
                (bind "${m}+${s}+Up" actions.move-column-to-workspace-up)
                (bind "${m}+${s}+Right" actions.move-column-right)

                (bind "${m}+${c}+J" actions.move-window-down-or-to-workspace-down)
                (bind "${m}+${c}+K" actions.move-window-up-or-to-workspace-up)

                (bind "${m}+${c}+Down" actions.move-window-down-or-to-workspace-down)
                (bind "${m}+${c}+Up" actions.move-window-up-or-to-workspace-up)

                # screenshots
                (bind "Print" (
                  if dms.enable then
                    (actions.spawn-sh "dms ipc niri screenshot")
                  else
                    (spawnMsg "screenshot -p false")
                ))
                (bind "${s}+Print" (
                  if dms.enable then
                    (actions.spawn-sh "dms ipc niri screenshotScreen")
                  else
                    (spawnMsg "screenshot-screen -p false")
                ))
                (bind "${a}+Print" (
                  if dms.enable then
                    (actions.spawn-sh "dms ipc niri screenshotWindow")
                  else
                    (spawnMsg "screenshot-window -p false")
                ))

                # volume and brightness
                (
                  let
                    inherit (config.home.sessionVariables) WOBSOCK_PATH;

                    audio = " && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{if ($3) print 0; else print int($2*100)}' > ${WOBSOCK_PATH}";
                    volume = " && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}' > ${WOBSOCK_PATH}";
                    brightness = " | awk '/Current brightness:/ { print int($3 / 255 * 100)}' > ${WOBSOCK_PATH}";
                    lightPkg = lib.getExe pkgs.brightnessctl;
                  in
                  [
                    (bind "XF86AudioMute" (actions.spawn-sh ("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" + audio)))
                    (bind "XF86AudioMicMute" (actions.spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

                    (bind "XF86AudioRaiseVolume" (
                      actions.spawn-sh ("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+" + volume)
                    ))
                    (bind "XF86AudioLowerVolume" (
                      actions.spawn-sh ("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-" + volume)
                    ))
                    (bind "${s}+XF86AudioRaiseVolume" (
                      actions.spawn-sh ("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%+" + volume)
                    ))
                    (bind "${s}+XF86AudioLowerVolume" (
                      actions.spawn-sh ("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%-" + volume)
                    ))
                    (bind "${m}+TouchpadScrollUp" (
                      actions.spawn-sh ("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+" + volume)
                    ))
                    (bind "${m}+TouchpadScrollDown" (
                      actions.spawn-sh ("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-" + volume)
                    ))

                    (bind "XF86MonBrightnessUp" (actions.spawn-sh ("sudo ${lightPkg} set 10%+" + brightness)))
                    (bind "XF86MonBrightnessDown" (actions.spawn-sh ("sudo ${lightPkg} set 10%-" + brightness)))
                    (bind "${s}+XF86MonBrightnessUp" (actions.spawn-sh ("sudo ${lightPkg} set 70%" + brightness)))
                    (bind "${s}+XF86MonBrightnessDown" (actions.spawn-sh ("sudo ${lightPkg} set 100%" + brightness)))

                    # (bind "${m}+TouchpadScrollRight" (actions.spawn-sh ("sudo ${lightPkg} -A 10" + brightness)))
                    # (bind "${m}+TouchpadScrollDown" (actions.spawn-sh ("sudo ${lightPkg} -U 10" + brightness)))

                    (bind "XF86Favorites" (actions.spawn-sh "wleave"))
                  ]
                )
              ]
            ));
        };
      };
  };
}
