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
                "return" = "footclient";
                "shift+return" = "footclient -a=foot_float";

                "b" =
                  if (proxy-suite.zapret.enable && proxy-suite.perAppRouting.enable) then
                    "proxy-ctl wrap zapret -- qutebrowser"
                  else
                    "qutebrowser";
                "shift+b" = "libreoffice";
                "v" = "AyuGram";
                "shift+v" = "equibop";
                "m" = "spotify";
                "shift+m" = "obsidian";
              }
            )

            (lib.concatMapAttrs
              (key: workspace: {
                "${cfg.config.modifier}+${key}" = "workspace ${workspace}";
                "${cfg.config.modifier}+shift+${key}" = "move container to workspace ${workspace}";
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
                "${cfg.config.modifier}+shift+${key}" = "move ${directory}";
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
