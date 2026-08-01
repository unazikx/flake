{
  ...
}:

{
  zen.programs.desktop.sway.binds = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.wayland.windowManager.sway;
      in
      {
        wayland.windowManager.sway.config = {
          keybindings = lib.mkMerge [
            (lib.concatMapAttrs
              (key: command: {
                "${cfg.config.modifier}+${key}" = command;
              })
              {
                "q" = "kill";
                "f" = "fullscreen";

                "shift+space" = "floating toggle; " + "resize set 90 ppt 90 ppt";
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

            (lib.concatMapAttrs
              (key: program: {
                "${cfg.config.modifier}+${key}" = "exec ${program}";
              })
              {
                "tab" = "tofi-drun | xargs swaymsg exec --";
                "space" = "vicinae toggle";

                "return" = "footclient";
                "shift+return" = "footclient -a=foot_float";

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
                pictures = "${config.xdg.userDirs.pictures}/$(date +'scr_%d-%m-%y_%H:%M:%S.png')";
                screenshot = mode: "exec ${lib.getExe pkgs.sway-contrib.grimshot} savecopy ${mode} ${pictures}";
              in
              {
                "Print" = screenshot "anything";
                "Print+Shift" = screenshot "output";
                "Print+Alt" = screenshot "active";
              }
            )

            (lib.concatMapAttrs
              (key: workspace: {
                "${cfg.config.modifier}+${key}" = "workspace ${workspace}";
                "${cfg.config.modifier}+Shift+${key}" = "move container to workspace ${workspace}";
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

            (lib.concatMapAttrs
              (key: directory: {
                "${cfg.config.modifier}+${key}" = "focus ${directory}";
                "${cfg.config.modifier}+Shift+${key}" = "move ${directory}";
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

            (lib.concatMapAttrs
              (key: axis: {
                "${cfg.config.modifier}+ctrl+${key}" = "resize shrink ${axis} 10 px or 10 ppt";
              })
              {
                h = "width";
                j = "height";
                left = "width";
                down = "height";
              }
            )

            (lib.concatMapAttrs
              (key: axis: {
                "${cfg.config.modifier}+ctrl+${key}" = "resize grow ${axis} 10 px or 10 ppt";
              })
              {
                k = "height";
                l = "width";
                up = "height";
                right = "width";
              }
            )
          ];
        };
      };
  };
}
