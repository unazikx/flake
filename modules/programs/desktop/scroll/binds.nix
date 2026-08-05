{
  ...
}:

{
  zen.programs.desktop.scroll.binds = {
    homeManagerNixos =
      {
        lib,
        config,
        ...
      }:
      let
        cfg = config.wayland.windowManager.scroll;
      in
      {
        wayland.windowManager.scroll.config = {
          keybindings = lib.mkMerge [
            (lib.concatMapAttrs
              (key: command: {
                "${cfg.config.modifier}+${key}" = command;
              })
              {
                "q" = "kill";
                "f" = "fullscreen";

                "shift+space" = "floating toggle; resize set 90 ppt 90 ppt";
                "alt+space" = "move position center";

                "g" = "layout tabbed";
                "shift+g" = "layout toggle split";

                "bracketleft" = "split h";
                "bracketright" = "split v";

                "p" = "move scratchpad";
                "shift+P" = "scratchpad show";
                "alt+P" = "scratchpad show; floating toggle";

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
                screenshot = "exec ${lib.getExe config.programs.wayshot.package}";
              in
              {
                "Print" = "${screenshot} -g";
                "Print+Shift" = screenshot;
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
          ];
        };
      };
  };
}
