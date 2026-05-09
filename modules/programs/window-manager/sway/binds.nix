{
  sway,
  pkgs,
  lib,
  config,
  ...
}:

let
  inherit (sway) modifier;

  mkPreset = pre: data: lib.concatMapAttrs pre data;
in

lib.mkMerge [
  (mkPreset
    (key: command: {
      "${modifier}+${key}" = command;
    })
    {
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

      "home" = "exit";
      "shift+home" = "reload";
    }
  )

  (mkPreset
    (key: program: {
      "${modifier}+${key}" = "exec ${program}";
    })
    {
      "tab" = "tofi-drun | xargs swaymsg exec --";
      "return" = "foot";
      "shift+return" = "foot -a=foot_float";

      "b" = "qutebrowser";
      "shift+b" = "libreoffice";
      "v" = "AyuGram";
      "shift+v" = "equibop";
      "m" = "spotify";
      "shift+m" = "obsidian";
    }
  )

  (
    let
      inherit (config.hm.xdg.userDirs.extraConfig) SCREENSHOTS;
      pictures = "${SCREENSHOTS}/$(date +'scr_%d-%m-%y_%H:%M:%S.png')";
      screenshot = mode: "exec ${lib.getExe pkgs.sway-contrib.grimshot} savecopy ${mode} ${pictures}";
    in
    {
      "Print" = screenshot "anything";
      "Print+Shift" = screenshot "output";
      "Print+Alt" = screenshot "active";
    }
  )

  (mkPreset
    (key: workspace: {
      "${modifier}+${key}" = "workspace ${workspace}";
      "${modifier}+Shift+${key}" = "move container to workspace ${workspace}";
    })
    (
      lib.genAttrs (
        (map toString (lib.lists.range 1 8))
        ++ [
          "i"
        ]
      ) toString
    )
  )

  (mkPreset
    (key: directory: {
      "${modifier}+${key}" = "focus ${directory}";
      "${modifier}+Shift+${key}" = "move ${directory}";
    })
    {
      h = "left";
      j = "down";
      k = "up";
      l = "right";
      left = "left";
      down = "down";
      up = "up";
      right = "right";
    }
  )

  (
    let
      mkResize = h: j: k: l: {
        "${modifier}+ctrl+${h}" = "resize shrink width 10 px or 10 ppt";
        "${modifier}+ctrl+${j}" = "resize shrink height 10 px or 10 ppt";
        "${modifier}+ctrl+${k}" = "resize grow height 10 px or 10 ppt";
        "${modifier}+ctrl+${l}" = "resize grow width 10 px or 10 ppt";
      };
    in
    lib.mkMerge [
      (mkResize "H" "J" "K" "L")
      (mkResize "left" "down" "up" "right")
    ]
  )
]
