{
  ...
}:

{
  zen.programs.desktop.noctalia.settings = {
    homeManager =
      {
        lib,
        config,
        ...
      }:
      {
        programs.noctalia = {
          settings = {
            bar = {
              default = {
                border = "surface_variant";
                capsule = true;
                center = [
                  "workspaces"
                  "screenshot"
                ];
                concave_edge_corners = true;
                contact_shadow = true;
                end = [
                  "tray"
                  "keyboard_layout"
                  "network"
                  "bluetooth"
                  "input_volume"
                  "volume"
                  "clock"
                  "brightness"
                  "battery"
                  "session"
                ];
                margin_ends = 0;
                position = lib.mkDefault "bottom";
                radius = 0;
                start = [
                  "launcher"
                  "media"
                  "notifications"
                  "clipboard"
                  "caffeine"
                ];
              };
            };

            control_center = {
              sidebar = "none";
              sidebar_section = "none";
            };

            dock = {
              active_scale = 0.9;
              concave_edge_corners = false;
              inactive_opacity = 0.6;
              inactive_scale = 0.8;
              launcher_icon = "michelin-star-green";
              launcher_position = "start";
              margin_edge = 8;
              reserve_space = false;
              smart_auto_hide = true;
            };

            hot_corners = {
              delay_ms = 700;
            };

            lockscreen = {
              blur_intensity = 1;
              blurred_desktop = true;
              tint_intensity = 0.55;
            };

            lockscreen_widgets = {
              enabled = true;

              grid = {
                cell_size = 32;
                major_interval = 4;
                visible = true;
              };

              schema_version = 2;

              widget = {
                "lockscreen-login-box@HDMI-A-1" = {
                  box_height = 196;
                  box_width = 810;
                  cx = 960;
                  cy = 830;
                  output = "HDMI-A-1";
                  placement_height = 1080;
                  placement_width = 1920;
                  rotation = 0;
                  settings = {
                    background_color = "surface_variant";
                    background_opacity = 0.88;
                    background_radius = 12;
                    center_password_text = false;
                    input_opacity = 1;
                    input_radius = 6;
                    layout = "regular";
                    show_caps_lock = true;
                    show_keyboard_layout = true;
                    show_login_button = true;
                    show_media = true;
                    show_session_buttons = true;
                    show_unlock_hint = true;
                    show_weather = true;
                  };
                  type = "login_box";
                };

                lockscreen-widget-0000000000000001 = {
                  box_height = 128;
                  box_width = 352;
                  cx = 960;
                  cy = 476;
                  output = "HDMI-A-1";
                  placement_height = 1080;
                  placement_width = 1920;
                  rotation = 0;
                  settings = {
                    background = false;
                    center_text = true;
                    clock_style = "digital";
                    shadow = true;
                  };
                  type = "clock";
                };
              };

              widget_order = [
                "lockscreen-login-box@HDMI-A-1"
                "lockscreen-widget-0000000000000001"
              ];
            };

            osd = {
              border = false;
            };

            plugins = {
              enabled = [
                "cleboost/anilist"
                "radimous/prismlauncher-instances"
              ];
            };

            shell = {
              button_borders = false;
              input_borders = false;
              keyboard_layout = {
                custom_labels = {
                  "English (US)" = "en";
                  Russian = "ru";
                };
              };

              launcher = {
                compact = true;
                show_app_actions = true;
                show_app_origin_indicator = false;
                sort_by_usage = false;
              };

              panel = {
                borders = false;
                clipboard_placement = "attached";
                list_item_background = true;
                open_near_click_clipboard = true;
                open_near_click_control_center = true;
                open_near_click_launcher = true;
                polkit_placement = "attached";
              };

              panel_anchor_bar = "default";
              password_style = "random";
              popup_borders = false;
              screen_time_enabled = true;
              shadow = {
                direction = "center";
              };
            };

            theme = {
              mode = config.stylix.polarity;
            };

            widget = {
              launcher = {
                glyph = "noctalia";
              };

              media = {
                hide_album_art = true;
                hide_when_no_media = true;
                max_length = 512;
              };

              network = {
                show_label = false;
                vpn_status = "both";
              };

              taskbar = {
                show_active_indicator = false;
                show_window_title = true;
              };

              tray = {
                drawer = true;
                hide_passive = false;
              };

              workspaces = {
                active_pill_size = 2;
                empty_color = "outline";
                focused_color = "tertiary";
                occupied_color = "outline";
                scale = 1.25;
                style = "minimal";
              };
            };
          };
        };
      };
  };
}
