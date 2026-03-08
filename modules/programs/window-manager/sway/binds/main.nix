{
  sway,
  pkgs,
  lib,
  config,
  ...
}:

let
  inherit (sway)
    modifier
    terminal
    menu
    ;

  act = import ./focus2ws.nix {
    inherit
      sway
      lib
      ;
  };

  # useful
  exec = "exec ";

  # functions
  mkProgram' = pre: data: lib.concatMapAttrs pre data;
  mkProgram =
    attrs:
    (mkProgram' (key: cmd: {
      "${modifier}+${key}" = cmd;
    }) attrs);
in

(mkProgram {
  "q" = "kill";
  "f" = "fullscreen";

  "space" = "floating toggle; " + "resize set 90 ppt 90 ppt";
  "alt+space" = "move position center";

  "g" = "layout tabbed";
  "shift+g" = "layout toggle split";

  "bracketleft" = "split h";
  "bracketright" = "split v";

  "p" = "move scratchpad";
  "shift+P" = "scratchpad show";
  "alt+P" = "scratchpad show; " + "floating toggle";

  "r" = "mode resize";
  "shift+r" = "mode gapsMode";

  "home" = "exit";
  "shift+home" = "reload";

  "tab" = exec + menu;
  "return" = exec + terminal;
  "shift+return" = exec + terminal + " --class=termfloat";

  "grave" =
    if config.hm.programs.wleave.enable then
      (lib.getExe config.hm.programs.wleave.package)
    else
      "swaymsg exit";

  "b" = "qutebrowser";
  "shift+b" = "keepassxc";
  "v" = "telegram-desktop";
  "shift+v" = "vesktop";
  "m" = "spotify";
})

// (
  let
    inherit (config.hm.xdg.userDirs.extraConfig) SCREENSHOTS;
    pic = " ${SCREENSHOTS}/$(date +'scr_%d-%m-%y_%H:%M:%S.png')";
    scr = n: exec + (lib.getExe pkgs.sway-contrib.grimshot) + " copysave " + n + pic;
  in
  {
    # screenshots
    "Print" = scr "anything";
    "Print+Shift" = scr "output";
    "Print+Alt" = scr "active";
  }
)
// {
  # sound
  "XF86AudioMute" = exec + "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
  "XF86AudioMicMute" =
    exec
    + (lib.getExe (
      pkgs.writeShellScriptBin "micMute" ''
        fixf4=$(cat /sys/class/leds/platform\:\:micmute/brightness);
        echo $((1-fixf4)) | sudo tee /sys/class/leds/platform\:\:micmute/brightness;
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      ''
    ));
  "XF86AudioRaiseVolume" = exec + "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
  "XF86AudioLowerVolume" = exec + "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
  "Shift+XF86AudioRaiseVolume" = exec + "wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+";
  "Shift+XF86AudioLowerVolume" = exec + "wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-";
}
// {
  "XF86Favorites" = "wleave";
  "Shift+XF86Favorites" = "poweroff";
  "Alt+XF86Favorites" = "reboot";
  "XF86HangupPhone" = "makoctl dismiss -a";
  "Shift+XF86HangupPhone" = "makoctl restore";
}
// act.workspacesAndMove
// act.resizeWindow
// act.moveAndFocus
