{
  zen,
  ...
}:

{
  zen.programs.desktop.umbriel.binds = {
    homeManager =
      {
        lib,
        config,
        ...
      }:
      let
        meta = zen.programs.desktop.umbriel.meta;
        noctalia = config.programs.noctalia;
      in
      {
        programs.umbriel.settings = {
          general.mod_key = "Super";

          keybinds = lib.mkMerge [
            (lib.concatMapAttrs
              (key: command: {
                "Mod+${key}" = "spawn:${command}";
              })
              {
                "Return" = "footclient";
                "B" = "qutebrowser";
                "V" = "AyuGram";
                "M" = "spotify";
              }
            )
            (lib.concatMapAttrs
              (key: command: {
                "Mod+${key}" = command;
              })
              (
                {
                  "Q" = "window-close";
                  "Grave" = "session-quit";
                  "Shift+O" = "dpms-off";

                  "MouseMiddle" = "layout-scroll-drag";

                  "Space" = "overview-toggle";
                  "Shift+Space" = "column-center";
                  "T" = "window-toggle-floating";
                  "P" = "window-toggle-pinned";
                  "F" = "window-toggle-maximize-to-edges";

                  "Prior" = "workspace-previous";
                  "Next" = "workspace-next";

                  "Shift+Next" = "window-move-to-workspace-next";
                  "Shift+Prior" = "window-move-to-workspace-previous";
                  "Shift+Down" = "window-move-to-workspace-next";
                  "Shift+Up" = "window-move-to-workspace-previous";

                  "Down" = "workspace-next";
                  "Up" = "workspace-previous";

                  "L" = "window-focus-next";
                  "H" = "window-focus-previous";
                  "Right" = "window-focus-next";
                  "Left" = "window-focus-previous";

                  "Shift+L" = "window-swap-next";
                  "Shift+H" = "window-swap-previous";
                  "Shift+Right" = "window-swap-next";
                  "Shift+Left" = "window-swap-previous";

                  "Minus" = "window-modify-width:-0.1";
                  "Equal" = "window-modify-width:+0.1";
                  "Shift+Minus" = "window-modify-height:-0.1";
                  "Shift+Equal" = "window-modify-height:+0.1";

                  "R" = "window-cycle-width";
                  "Alt+R" = "window-cycle-height";
                }
                // (lib.genAttrs (map (n: toString n) (lib.range 1 meta.workspaceCount)) (
                  n: "workspace-switch:${n}"
                ))
                // (lib.listToAttrs (
                  map (n: {
                    name = "Shift+${toString n}";
                    value = "window-move-to-workspace:${toString n}";
                  }) (lib.range 1 meta.workspaceCount)
                ))
              )
            )
            # noctalia integration
            # ^^^ https://docs.noctalia.dev/umbriel/keybinds/?section=example-noctalia-shell-integration#example-noctalia-shell-integration
            (lib.mkIf noctalia.enable (
              lib.concatMapAttrs
                (key: command: {
                  "${key}" = "spawn:noctalia msg ${command}";
                })
                {
                  "Mod+Tab" = "panel-toggle launcher";

                  "Mod+W" = "window-switcher";
                  "Mod+Z" = "panel-toggle launcher /emo";
                  "Mod+X" = "panel-toggle clipboard";

                  "Mod+Backspace" = "session lock";
                  "Mod+Escape" = "panel-toggle session";

                  "Print" = "screenshot-region";
                  "Shift+Print" = "screenshot-fullscreen";
                }
            ))
          ];

          hot_corners = {
            bottom_left = {
              enabled = true;
              delay_ms = 500;
              action = "overview-open";
            };
          };
        };
      };
  };
}
