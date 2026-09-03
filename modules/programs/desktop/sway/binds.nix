{
  ...
}:

{
  zen.programs.desktop.sway.binds = {
    homeManagerNixos =
      {
        lib,
        config,
        osConfig,
        ...
      }:
      let
        cfg = config.wayland.windowManager.sway;
        proxy-suite = osConfig.services.proxy-suite;
      in
      {
        wayland.windowManager.sway.config = {
          keybindings = lib.mkMerge [
            (lib.concatMapAttrs
              (key: command: {
                "${cfg.config.modifier}+${key}" = command;
              })
              {
                "Q" = "kill";
                "F" = "fullscreen";

                "Shift+Space" = "floating toggle; " + "resize set 90 ppt 90 ppt";
                "Alt+Space" = "move position center";

                "G" = "layout tabbed";
                "Shift+G" = "layout toggle split";

                "Bracketleft" = "split h";
                "Bracketright" = "split v";

                "P" = "move scratchpad";
                "Shift+P" = "scratchpad show";
                "Alt+P" = "scratchpad show; " + "floating toggle";

                "Home" = "exit";
                "Shift+Home" = "reload";
              }
            )

            (lib.concatMapAttrs
              (key: program: {
                "${cfg.config.modifier}+${key}" = "exec ${program}";
              })
              {
                "Return" = "footclient";
                "Shift+Return" = "footclient -a=foot_float";

                "B" =
                  if (proxy-suite.zapret.enable && proxy-suite.perAppRouting.enable) then
                    "proxy-ctl wrap zapret -- qutebrowser"
                  else
                    "qutebrowser";
                "Shift+B" = "libreoffice";
                "V" = "AyuGram";
                "Shift+V" = "equibop";
                "M" = "spotify";
                "Shift+M" = "obsidian";
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
                H = "left";
                J = "down";
                K = "up";
                L = "right";
                Left = "left";
                Down = "down";
                Up = "up";
                Right = "right";
              }
            )

            (lib.concatMapAttrs
              (key: axis: {
                "${cfg.config.modifier}+ctrl+${key}" = "resize shrink ${axis} 10 px or 10 ppt";
              })
              {
                H = "width";
                J = "height";
                Left = "width";
                Down = "height";
              }
            )

            (lib.concatMapAttrs
              (key: axis: {
                "${cfg.config.modifier}+ctrl+${key}" = "resize grow ${axis} 10 px or 10 ppt";
              })
              {
                K = "height";
                L = "width";
                Up = "height";
                Right = "width";
              }
            )
          ];
        };
      };
  };
}
