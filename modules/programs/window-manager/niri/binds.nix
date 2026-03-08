{
  pkgs,
  lib,
  config,
  ...
}:

with config.hm.lib.niri.actions;

# modificators
let
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

  sh = spawn-sh;
  msg = cmd: sh ("niri msg action " + cmd);
in

(lib.listToAttrs (
  # programs
  [
    (bind "${m}+Tab" (sh "bash -c tofi-drun | xargs niri msg action spawn --"))
    (bind "${m}+${s}+Tab" (sh (lib.getExe pkgs.clapboard)))

    (bind "${m}+Return" (sh "kitty"))
    (bind "${m}+${s}+Return" (sh "kitty --class=kitty_small"))

    (bind "${m}+V" (sh "AyuGram"))
    (bind "${m}+${s}+V" (sh "equibop"))

    (bind "${m}+B" (sh "qutebrowser"))
    (bind "${m}+${s}+B" (sh "librewolf"))

    (bind "${m}+M" (sh "spotify"))
    (bind "${m}+${s}+M" (sh "obsidian"))
  ]
  ++
    # main actions
    [
      (bind "${m}+${s}+Slash" show-hotkey-overlay) # help

      (bind "${m}+Q" close-window)

      (bind "${m}+Space" toggle-overview)
      (bind "${m}+${a}+Space" center-window)
      (bind "${m}+${s}+Space" (
        if config.hm.programs.wleave.enable then
          (sh (lib.getExe config.hm.programs.wleave.package))
        else
          quit
      ))

      (bind "${m}+F" fullscreen-window)
      (bind "${m}+${s}+F" maximize-column)

      # (bind "Print" (spawn "niri" "msg" "action" "screenshot-screen"))
      # (bind "${s}+Print" screenshot-window)
      # https://github.com/sodiboo/niri-flake/issues/1380
      # fuck it, i w'ont to fuck with this

      (bind "${m}+S" switch-preset-column-width)
      (bind "${m}+${s}+S" switch-preset-window-height)

      (bind "${m}+Minus" (set-column-width "-10%"))
      (bind "${m}+Equal" (set-column-width "+10%"))
      (bind "${m}+${s}+Minus" (set-window-height "-10%"))
      (bind "${m}+${s}+Equal" (set-window-height "+10%"))

      (bind "${m}+Comma" consume-window-into-column)
      (bind "${m}+Period" expel-window-from-column)
    ]
  # windows manipukating
  ++ [
    (bind "${m}+H" focus-column-left)
    (bind "${m}+J" focus-window-or-workspace-down)
    (bind "${m}+K" focus-window-or-workspace-up)
    (bind "${m}+L" focus-column-right)

    (bind "${m}+Left" focus-column-left)
    (bind "${m}+Down" focus-window-or-workspace-down)
    (bind "${m}+Up" focus-window-or-workspace-up)
    (bind "${m}+Right" focus-column-right)

    (bind "${m}+${s}+H" move-column-left)
    (bind "${m}+${s}+J" move-column-to-workspace-down)
    (bind "${m}+${s}+K" move-column-to-workspace-up)
    (bind "${m}+${s}+L" move-column-right)

    (bind "${m}+${s}+Left" move-column-left)
    (bind "${m}+${s}+Down" move-column-to-workspace-down)
    (bind "${m}+${s}+Up" move-column-to-workspace-up)
    (bind "${m}+${s}+Right" move-column-right)

    (bind "${m}+${c}+J" move-window-down-or-to-workspace-down)
    (bind "${m}+${c}+K" move-window-up-or-to-workspace-up)

    (bind "${m}+${c}+Down" move-window-down-or-to-workspace-down)
    (bind "${m}+${c}+Up" move-window-up-or-to-workspace-up)
  ]
  # screenshots
  ++ [
    (bind "Print" (msg "screenshot -p false"))
    (bind "${s}+Print" (msg "screenshot-screen -p false"))
    (bind "${a}+Print" (msg "screenshot-window -p false"))
  ]
  # volume and brightness
  ++ (
    let
      inherit (config.hm.home.sessionVariables)
        WOBSOCK_PATH
        ;

      mute = " && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{if ($3) print 0; else print int($2*100)}' > ${WOBSOCK_PATH}";
      vol = " && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}' > ${WOBSOCK_PATH}";
      light = " | awk '/Current brightness:/ { print int($3 / 255 * 100)}' > ${WOBSOCK_PATH}";
      lightPkg = lib.getExe pkgs.brightnessctl;

      make = volume: audio: brightness: [
        (bind "XF86AudioMute" (sh ("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" + audio)))
        (bind "XF86AudioMicMute" (sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

        (bind "XF86AudioRaiseVolume" (sh ("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+" + volume)))
        (bind "XF86AudioLowerVolume" (sh ("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-" + volume)))
        (bind "${s}+XF86AudioRaiseVolume" (sh ("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%+" + volume)))
        (bind "${s}+XF86AudioLowerVolume" (sh ("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%-" + volume)))

        (bind "${m}+TouchpadScrollUp" (sh ("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+" + volume)))
        (bind "${m}+TouchpadScrollDown" (sh ("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-" + volume)))

        (bind "XF86MonBrightnessUp" (sh ("sudo ${lightPkg} set 10%+" + brightness)))
        (bind "XF86MonBrightnessDown" (sh ("sudo ${lightPkg} set 10%-" + brightness)))
        (bind "${s}+XF86MonBrightnessUp" (sh ("sudo ${lightPkg} set 70%" + brightness)))
        (bind "${s}+XF86MonBrightnessDown" (sh ("sudo ${lightPkg} set 100%" + brightness)))

        (bind "${m}+TouchpadScrollRight" (sh ("sudo ${lib.getExe pkgs.brightnessctl} -A 10" + brightness)))
        (bind "${m}+TouchpadScrollDown" (sh ("sudo ${lib.getExe pkgs.brightnessctl} -U 10" + brightness)))

        (bind "XF86Favorites" (spawn "wleave"))
      ];
    in
    if (config.hm.services.wob.enable) then
      (make vol mute light)
    else
      (make (toString null) (toString null) (toString null))
  )
))
# workspaces switch
// {
  "${m}+WheelScrollDown" = {
    cooldown-ms = 150;
    action = focus-workspace-down;
  };

  "${m}+WheelScrollUp" = {
    cooldown-ms = 150;
    action = focus-workspace-up;
  };

  "${m}+1".action = focus-workspace 1;
  "${m}+2".action = focus-workspace 2;
  "${m}+3".action = focus-workspace 3;
  "${m}+4".action = focus-workspace 4;
  "${m}+5".action = focus-workspace 5;
  "${m}+6".action = focus-workspace 6;
  "${m}+7".action = focus-workspace 7;
  "${m}+8".action = focus-workspace 8;
  "${m}+9".action = focus-workspace 9;
  "${m}+0".action = focus-workspace 10;

  "${m}+${s}+1".action = msg "move-column-to-workspace 1";
  "${m}+${s}+2".action = msg "move-column-to-workspace 2";
  "${m}+${s}+3".action = msg "move-column-to-workspace 3";
  "${m}+${s}+4".action = msg "move-column-to-workspace 4";
  "${m}+${s}+5".action = msg "move-column-to-workspace 5";
  "${m}+${s}+6".action = msg "move-column-to-workspace 6";
  "${m}+${s}+7".action = msg "move-column-to-workspace 7";
  "${m}+${s}+8".action = msg "move-column-to-workspace 8";
  "${m}+${s}+9".action = msg "move-column-to-workspace 9";
  "${m}+${s}+0".action = msg "move-column-to-workspace 10";
}
