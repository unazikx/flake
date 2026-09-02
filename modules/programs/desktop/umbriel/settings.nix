{
  zen,
  ...
}:

{
  zen.programs.desktop.umbriel.settings = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        meta = zen.programs.desktop.umbriel.meta;
        colors = config.lib.stylix.colors.withHashtag;
      in
      {
        programs.umbriel.settings = {
          general = {
            autostart = [
              "${lib.getExe pkgs.swaybg} -m fill -i ${config.stylix.image}"
              "noctalia"
            ];

            xwayland = true;
            show_cheatsheet = false;
            focus_on_activate = false;
            honor_restored_maximize = false;
          };

          colors = {
            background = colors.base00;
            text_primary = colors.base05;
            text_muted = colors.base04;
            accent_primary = colors.base0E;
            accent_secondary = colors.base0B;
            warning = colors.base0A;
            error = colors.base08;
          };

          animation = {
            enabled = true;
            duration_ms = 250;
            curve = "easeout";

            windows_in = {
              enabled = true;
              duration_ms = 100;
              curve = "easeout";
              style = "fade";
              scale = 0.90;
            };

            windows_out = {
              enabled = true;
              duration_ms = 100;
              curve = "easeout";
              style = "fade";
            };

            windows_move = {
              enabled = true;
              duration_ms = 250;
              curve = "snappy";
            };

            workspaces = {
              enabled = true;
              duration_ms = 250;
              curve = "easeout";
            };

            overview = {
              enabled = true;
              duration_ms = 250;
              curve = "easeout";
            };

            dim_unfocused = {
              enabled = true;
              duration_ms = 250;
              curve = "easeout";
              dim = 0.2;
            };

            layers = {
              enabled = true;
              duration_ms = 250;
              curve = "easeout";
            };
          };

          appearance = {
            prefer_no_csd = true;
            border_width = 3;
            corner_radius = 12;
            drag_opacity = 0.75;

            border_focused = colors.base0E;
            border_unfocused = colors.base00;
            scratchpad_border_focused = colors.base0C;
            scratchpad_border_unfocused = colors.base00;
            outer_border_color = colors.base01;
            insert_hint_color = colors.base02;
            backdrop_color = colors.base00;

            blur = {
              enabled = true;
              optimized = true;
              passes = 3;
              radius = 3;
              noise = 0.02;
              brightness = 0.9;
              contrast = 0.9;
              saturation = 1.1;
            };

            shadow = {
              enabled = true;
              softness = 10;
              offset_x = 2;
              offset_y = 2;
              color = "${colors.base00}7F";
            };
          };

          overview = {
            zoom = 0.75;
            background_blur = true;
            background_tint = "${colors.base01}30";
            workspace_background = "${colors.base00}BB";
            shortcuts = true;
            shortcut_keys = "asdfghjkl";
            badge_color = colors.base0E;
          };

          layout = {
            mode = "scrolling";
            gap = 12;

            width_presets = [
              0.333
              0.5
              0.7
            ];

            struts = {
              left = 0;
              right = 0;
              top = 0;
              bottom = 0;
            };

            scrolling = {
              direction = "horizontal";
              default_width_fraction = 0.9;
              center_underfull_strip = true;
              center_focused = true;
              expand_single_column = true;
            };
          };

          input = {
            middle_click_paste = false;

            keyboard = {
              layout = "us,ru";
              variant = "";
              options = "grp:caps_toggle";
              repeat_rate = 25;
              repeat_delay = 600;
              numlock_toggle = true;
              track_layout = "global";
            };

            mouse = {
              natural_scroll = false;
              sensitivity = 0.0;
              scroll_wheel_step = 60;
            };

            cursor = {
              theme = "";
              size = 24;
              hardware_cursor = true;
              follows_focus = false;
            };

            focus = {
              follows_mouse = false;
            };
          };

          output = {
            "HDMI-A-1" = {
              workspaces = meta.workspaceCount;
            };
          };
        };
      };
  };
}
