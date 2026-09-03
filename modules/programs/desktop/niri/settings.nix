{
  ...
}:

{
  zen.programs.desktop.niri.settings = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
        include = config.lib.niri.include;
        actions = config.lib.niri.actions;
      in
      {
        programs.niri = {
          settings = {
            includes = [
              (include.optional "~/.config/niri/monitors.kdl")
            ];

            screenshot-path = "~/Pictures/screenshots/niri_%d-%m-%y_%H:%M:%S.png";

            outputs = {
              "eDP-1".scale = 1.0;
            };

            input = {
              keyboard.xkb = {
                layout = "us,ru";
                options = "grp:caps_toggle, lv3:ralt_switch";
              };

              mouse = {
                scroll-method = "no-scroll";
                accel-profile = "adaptive";
              };

              trackpoint = {
                scroll-method = "on-button-down";
                accel-profile = "flat";
              };

              touchpad = {
                tap = true;
                dwt = true;
                dwtp = true;

                natural-scroll = false;

                click-method = "clickfinger";
                scroll-method = "two-finger";
                accel-profile = "adaptive";
              };

              power-key-handling.enable = false;
              focus-follows-mouse.enable = false;
              workspace-auto-back-and-forth = false;
            };

            cursor = {
              hide-when-typing = true;
              hide-after-inactive-ms = 1000;
            };

            layout = {
              background-color = colors.base00;

              border = {
                enable = true;
                width = 5;

                active = {
                  gradient = {
                    from = colors.base0B;
                    to = colors.base0A;
                    relative-to = "workspace-view";
                    angle = 45;
                  };
                };

                inactive = {
                  gradient = {
                    from = colors.base0B;
                    to = colors.base0A;
                    relative-to = "workspace-view";
                    angle = 45;
                  };
                };

                urgent = {
                  gradient = {
                    from = colors.base08;
                    to = colors.base09;
                    relative-to = "workspace-view";
                    angle = 45;
                  };
                };
              };

              insert-hint = {
                display.color = colors.base01 + "CC";
              };

              gaps = 8;

              # WARN:
              # it makes side window little visible
              #
              # struts = lib.genAttrs [
              #   "left"
              #   "right"
              #   "top"
              #   "bottom"
              # ] (_: 4);

              shadow = {
                enable = true;
                softness = 30;
                draw-behind-window = true;

                color = colors.base00 + "70";
                inactive-color = colors.base00 + "70";
              };

              default-column-width.proportion = 0.9;

              preset-column-widths = [
                { proportion = 0.4; }
                { proportion = 0.5; }
                { proportion = 0.9; }
                { proportion = 1.0; }
              ];

              preset-window-heights = [
                { proportion = 0.4; }
                { proportion = 0.5; }
                { proportion = 1.0; }
              ];

              center-focused-column = "on-overflow";
              always-center-single-column = true;
            };

            recent-windows = {
              enable = true;

              debounce-ms = 750;
              open-delay-ms = 150;

              highlight = {
                active-color = "${colors.base04}ff";
                urgent-color = "${colors.base08}ff";
                corner-radius = 12;
                padding = 30;
              };

              previews = {
                max-height = 480;
                max-scale = 0.5;
              };

              binds =
                let
                  rewin = lib.mergeAttrsList actions.recent-windows;
                in
                {
                  "Alt+Tab".action = rewin.next-window;
                  "Alt+Shift+Tab".action = rewin.previous-window;
                };
            };

            animations = {
              "horizontal-view-movement" = {
                kind.easing = {
                  duration-ms = 150;
                  curve = "ease-out-quad";
                };
              };
              "window-resize" = {
                kind.easing = {
                  duration-ms = 150;
                  curve = "ease-out-quad";
                };
              };
              "window-close" = {
                kind.easing = {
                  duration-ms = 150;
                  curve = "ease-out-expo";
                };
              };
              "window-open" = {
                kind.easing = {
                  duration-ms = 150;
                  curve = "ease-out-expo";
                };
              };
              "window-movement" = {
                kind.easing = {
                  duration-ms = 150;
                  curve = "ease-out-expo";
                };
              };
              "workspace-switch" = {
                kind.easing = {
                  duration-ms = 150;
                  curve = "ease-out-expo";
                };
              };
            };

            window-rules = [
              {
                clip-to-geometry = true;
                geometry-corner-radius = lib.genAttrs [
                  "top-left"
                  "top-right"
                  "bottom-left"
                  "bottom-right"
                ] (_: 12.0);
              }
            ];

            layer-rules = [
              {
                block-out-from = "screencast";
                matches = [
                  {
                    namespace = "^notifications$";
                  }
                ];
              }
              {
                place-within-backdrop = true;
                matches = [
                  {
                    namespace = "dms:blurwallpaper";
                  }
                ];
              }
            ];

            workspaces = lib.genAttrs (map toString (lib.range 1 5)) (_: { });

            overview = {
              zoom = 0.95;
              backdrop-color = colors.base00;

              workspace-shadow = {
                softness = 20;
                spread = 14;

                color = colors.base00;
              };
            };

            spawn-at-startup = [
              {
                sh = "noctalia";
              }
              {
                sh = "AyuGram -startintray";
              }
              {
                sh = "vesktop --start-minimized";
              }
              {
                sh = "${lib.getExe pkgs.swaybg} -m fill -i ${config.stylix.image}";
              }
            ];

            clipboard.disable-primary = true;
            gestures.hot-corners.enable = false;
            hotkey-overlay.skip-at-startup = true;
            prefer-no-csd = true;

            environment = {
              # WOBSOCK = config.home.sessionVariables.WOBSOCK;
            };

            debug.deactivate-unfocused-windows = true;

            xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
          };
        };
      };
  };
}
