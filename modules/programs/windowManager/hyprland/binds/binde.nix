{
  pkgs,
  lib,
  config,
  binds,
  ...
}:

let
  inherit (binds)
    mod
    shift
    alt
    ctrl
    fn
    fnShift
    ;
in

[
  # hjkl
  (mod "h" "movefocus, l")
  (mod "j" "movefocus, d")
  (mod "k" "movefocus, u")
  (mod "l" "movefocus, r")

  (shift "h" "resizeactive, -50  0")
  (shift "j" "resizeactive, 0   50")
  (shift "k" "resizeactive, 0  -50")
  (shift "l" "resizeactive, 50   0")

  (alt "h" "moveactive, -50  0")
  (alt "j" "moveactive, 0   50")
  (alt "k" "moveactive, 0  -50")
  (alt "l" "moveactive, 50   0")

  (ctrl "h" "swapwindow, l")
  (ctrl "j" "swapwindow, d")
  (ctrl "k" "swapwindow, u")
  (ctrl "l" "swapwindow, r")

  # arrows
  (mod "left " "movefocus, l")
  (mod "down " "movefocus, d")
  (mod "up   " "movefocus, u")
  (mod "right" "movefocus, r")

  (shift "left " "resizeactive, -50  0")
  (shift "down " "resizeactive, 0   50")
  (shift "up   " "resizeactive, 0  -50")
  (shift "right" "resizeactive, 50   0")

  (alt "left " "moveactive, -50  0")
  (alt "down " "moveactive, 0   50")
  (alt "up   " "moveactive, 0  -50")
  (alt "right" "moveactive, 50   0")

  (ctrl "left " "swapwindow, l")
  (ctrl "down " "swapwindow, d")
  (ctrl "up   " "swapwindow, u")
  (ctrl "right" "swapwindow, r")

  (fn "XF86AudioMute" "$ex, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")

  (fn "XF86AudioMicMute" "$ex, ${lib.getExe (
    pkgs.writeShellScriptBin "micMute" ''
      fixf4=$(cat /sys/class/leds/platform\:\:micmute/brightness);
      echo $((1-fixf4)) | sudo ${lib.getExe' pkgs.coreutils "tee"} /sys/class/leds/platform\:\:micmute/brightness;
      wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    ''
  )}")

  (fn "XF86Favorites" "$ex, wleave")
  (fnShift "XF86Favorites" "$ex, hyprctl dispatch dpms toggle")

  (fn "XF86HangupPhone" "$ex, makoctl dismiss -a")
  (fnShift "XF86HangupPhone" "$ex, makoctl restore")

  (fn "XF86AudioRaiseVolume" "$ex, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
  (fn "XF86AudioLowerVolume" "$ex, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-")
  (fnShift "XF86AudioRaiseVolume" "$ex, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%+")
  (fnShift "XF86AudioLowerVolume" "$ex, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%-")
]
++ (lib.optionals config.hm.services.wob.enable [
  (fn "XF86AudioRaiseVolume" "$ex, wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}' > $WOBSOCK")
  (fn "XF86AudioLowerVolume" "$ex, wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}' > $WOBSOCK")
  (fnShift "XF86AudioRaiseVolume" "$ex, wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}' > $WOBSOCK")
  (fnShift "XF86AudioLowerVolume" "$ex, wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}' > $WOBSOCK")

  (fn "XF86AudioMute" "$ex, wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{if ($3) print int($2*100); else print 0}' > $WOBSOCK")
])
++ (
  let
    light = arg: [
      (fn "XF86MonBrightnessDown" ("$ex, sudo ${lib.getExe pkgs.brightnessctl} set 10%+" + arg))
      (fn "XF86MonBrightnessUp  " ("$ex, sudo ${lib.getExe pkgs.brightnessctl} set 10%-" + arg))
      (fnShift "XF86MonBrightnessDown" ("$ex, sudo ${lib.getExe pkgs.brightnessctl} set 70%" + arg))
      (fnShift "XF86MonBrightnessUp  " ("$ex, sudo ${lib.getExe pkgs.brightnessctl} set 100%" + arg))
    ];
  in
  if config.hm.services.wob.enable then
    (light " | awk '/Current brightness:/ { print int($3 / 255 * 100)}' > $WOBSOCK")
  else
    (light (toString null))
)
