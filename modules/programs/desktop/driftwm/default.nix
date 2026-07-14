{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    driftwm = {
      type = "github";
      owner = "malbiruk";
      repo = "driftwm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.programs.desktop.driftwm = {
    description = ''
      infinite canvas wayland
      like newm but other...idk
    '';

    includes = [
      zen.programs.desktop.driftwm.shaders
    ];

    nixos =
      {
        inputs,
        lib,
        config,
        user,
        ...
      }:
      {
        imports = [
          inputs.driftwm.nixosModules.default
        ];

        programs.driftwm = {
          enable = true;
        };

        # fucking idiots why blyat?
        # я вас всех в жопу ебал бляди нахуя
        services = {
          gnome.gnome-keyring.enable = lib.mkForce false;

          greetd.settings = {
            initial_session = lib.mkIf (user.defaultWm == "halley") {
              user = lib.userName;
              command = lib.getExe config.programs.driftwm.package;
            };
          };
        };
      };

    homeManager =
      {
        inputs',
        pkgs,
        lib,
        ...
      }:
      {
        programs.driftwm = {
          enable = true;

          package = inputs'.driftwm.packages.default;

          settings = {
            focus_follows_mouse = true;
            window_placement = "auto";
            mod_key = "super";

            input = {
              keyboard = {
                layout = "us,ru";
                options = "grp:caps_toggle";
              };

              mouse = {
                accel_speed = 0.2;
                accel_profile = "adaptive";
              };
            };

            zoom = {
              step = 1.5;
              fit_padding = 50.0;
              reset_on_new_window = false;
              reset_on_activation = true;
            };

            cursor = {
              inactive_opacity = 0.5;
            };

            decorations = {
              default_mode = "minimal";
              bg_color = "#151515";
              fg_color = "#e8e3e3";
              border_color = "#151515";
              border_color_focused = "#a988b0";
              corner_radius = 14;
              border_width = 3;
              title_bar_height = 25;
              font = "";
              title_align = "left";
              shadow = true;
            };

            snap = {
              gap = 8;
              distance = 20;
              break_force = 30;
              same_edge = true;
              edge_center = true;
            };

            navigation = {
              trackpad_speed = 1.5;
              mouse_speed = 1.5;
              friction = 0.2;
              animation_speed = 0.4;
              nudge_step = 20;
              pan_step = 200.0;
            };

            navigation.edge_pan = {
              zone = 0;
            };

            mouse = {
              decoration_resize_snapped = false;
              decoration_fit_snapped = false;

              on-window = {
                "mod+middle" = "pan-viewport";
                "mod+right" = "resize-window";
                "mod+left" = "move-window";

                "alt+left" = "move-window";
                "alt+shift+left" = "move-snapped-windows";
                "alt+right" = "resize-window";
                "alt+shift+right" = "resize-window-snapped";
                "alt+middle" = "fit-window";
                "alt+shift+middle" = "fit-window-snapped";
              };

              on-canvas = {
                "left" = "pan-viewport";
                "wheel-scroll" = "zoom";
              };

              anywhere = {
                "mod+middle" = "pan-viewport";
                "mod+wheel-scroll" = "zoom";

                "mod+ctrl+left" = "none";
                "mod+trackpad-scroll" = "none";
              };
            };

            keybindings = {
              "mod+return" = "exec foot";
              "mod+tab" = "exec tofi-drun | xargs sh -c --";
              "mod+b" = "exec qutebrowser";

              "mod+m" = "quit";
              "mod+q" = "close-window";
              "mod+c" = "center-window";
              "mod+f" = "toggle-fullscreen";
              "mod+space" = "zoom-to-fit";

              "mod+up" = "center-nearest up";
              "mod+down" = "center-nearest down";
              "mod+left" = "center-nearest left";
              "mod+right" = "center-nearest right";

              "mod+shift+up" = "pan-viewport up";
              "mod+shift+down" = "pan-viewport down";
              "mod+shift+left" = "pan-viewport left";
              "mod+shift+right" = "pan-viewport right";

              "mod+shift+m" = "none";
              "mod+x" = "none";
              "mod+a" = "none";
              "alt+tab" = "none";
              "alt+shift+tab" = "none";
              "mod+equal" = "none";
              "mod+minus" = "none";
              "mod+0" = "none";
              "mod+z" = "none";
              "mod+w" = "none";
              "mod+shift+w" = "none";
              "mod+1" = "none";
              "mod+2" = "none";
              "mod+3" = "none";
              "mod+4" = "none";
              "mod+alt+up" = "none";
              "mod+alt+down" = "none";
              "mod+alt+left" = "none";
              "mod+alt+right" = "none";
              "mod+l" = "none";
              "mod+ctrl+shift+q" = "none";
              "XF86AudioRaiseVolume" = "none";
              "XF86AudioLowerVolume" = "none";
              "XF86AudioMute" = "none";
              "XF86MonBrightnessUp" = "none";
              "XF86MonBrightnessDown" = "none";
              "Print" = "none";
              "shift+Print" = "none";
            };

            window_rules = [
              {
                app_id = "*";
                size = [
                  1800
                  1000
                ];
              }
            ];
          };
        };

        # та же хуйня:wq
        services.gnome-keyring.enable = lib.mkForce false;

        xdg.portal = {
          config.niri = {
            default = "gnome"; # fallback
            "org.freedesktop.impl.portal.ScreenCast" = "gnome";
            "org.freedesktop.impl.portal.Screenshot" = "gnome";
            "org.freedesktop.impl.portal.FileChooser" = "gnome";
            "org.freedesktop.impl.portal.OpenURI" = "gnome";
          };

          configPackages = [ pkgs.xdg-desktop-portal-gnome ];
        };
      };
  };
}
