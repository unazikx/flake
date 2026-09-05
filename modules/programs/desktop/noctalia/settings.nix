{
  zen,
  ...
}:

{
  zen.programs.desktop.noctalia.settings = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        meta = zen.miscellaneous.users.accounts.meta;
      in
      {
        programs.noctalia.settings = {
          bar = {
            default = {
              border = "surface_variant";
              capsule = true;
              concave_edge_corners = true;
              contact_shadow = true;
              margin_ends = 0;
              position = lib.mkDefault "bottom";
              radius = 0;

              start = [
                "group:g6"
                "group:g7"
                "group:g5"
              ];

              center = [
                "group:g10"
                "group:g9"
              ];

              end = [
                "group:g8"
                "group:g3"
                "group:g2"
                "group:g4"
                "group:g1"
              ];

              capsule_group = [
                {
                  accordion = true;
                  accordion_direction = "end";
                  enabled = true;
                  fill = "surface_variant";
                  id = "g1";
                  members = [
                    "battery"
                    "session"
                  ];
                  opacity = 1.0;
                  padding = 6.0;
                }
                {
                  accordion = false;
                  accordion_direction = "end";
                  enabled = true;
                  fill = "surface_variant";
                  id = "g2";
                  members = [
                    "volume"
                    "input_volume"
                  ];
                  opacity = 1.0;
                  padding = 6.0;
                }
                {
                  accordion = true;
                  accordion_direction = "start";
                  enabled = true;
                  fill = "surface_variant";
                  id = "g3";
                  members = [
                    "tray"
                    "network"
                    "bluetooth"
                  ];
                  opacity = 1.0;
                  padding = 6.0;
                }
                {
                  accordion = false;
                  accordion_direction = "end";
                  enabled = true;
                  fill = "surface_variant";
                  id = "g4";
                  members = [
                    "clock"
                    "weather"
                  ];
                  opacity = 1.0;
                  padding = 6.0;
                }
                {
                  accordion = true;
                  accordion_direction = "end";
                  enabled = true;
                  fill = "surface_variant";
                  id = "g6";
                  members = [
                    "launcher"
                    "notifications"
                    "clipboard"
                  ];
                  opacity = 1.0;
                  padding = 6.0;
                  widget_spacing = 12;
                }
                {
                  accordion = false;
                  accordion_direction = "end";
                  enabled = true;
                  fill = "surface_variant";
                  id = "g7";
                  members = [
                    "media"
                    "audio_visualizer"
                  ];
                  opacity = 1.0;
                  padding = 6.0;
                }
                {
                  accordion = false;
                  accordion_direction = "end";
                  enabled = true;
                  fill = "surface_variant";
                  id = "g5";
                  members = [
                    "caffeine"
                    "brightness"
                  ];
                  opacity = 1.0;
                  padding = 6.0;
                }
                {
                  accordion = false;
                  accordion_direction = "end";
                  enabled = true;
                  fill = "surface_variant";
                  id = "g8";
                  members = [
                    "keyboard_layout"
                    "lock_keys"
                  ];
                  opacity = 1.0;
                  padding = 6.0;
                }
                {
                  accordion = false;
                  accordion_direction = "end";
                  enabled = true;
                  fill = "surface_variant";
                  id = "g9";
                  members = [
                    "screenshot"
                    "wallpaper"
                  ];
                  opacity = 1.0;
                  padding = 6.0;
                }
                {
                  accordion = false;
                  accordion_direction = "end";
                  enabled = true;
                  fill = "surface_variant";
                  id = "g10";
                  members = [
                    "active_window"
                    "workspaces"
                  ];
                  opacity = 1.0;
                  padding = 6.0;
                }
              ];

              dead_zone.actions = {
                scroll_down = "workspace-switch up";
                scroll_up = "workspace-switch down";
              };
            };
          };

          control_center = {
            sidebar = "full";
            sidebar_section = "none";
          };

          notification = {
            offset_x = 20;
            offset_y = 20;
            position = "bottom_right";
          };

          osd = {
            position = "top_center";
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
            delay_ms = 450;
            enabled = true;

            bottom_left.action = "window_switcher";
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
            avatar_path = toString (pkgs.fetchurl meta.userIcon);

            launch_apps_as_systemd_services = true;
            polkit_agent = true;

            session.show_shortcuts = false;
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
              alpha = 0.2;
            };
          };

          theme = {
            mode = config.stylix.polarity;
          };

          idle = {
            behavior_order = [
              "lock"
              "screen-off"
              "lock-and-suspend"
            ];

            behavior = {
              lock = {
                action = "lock";
                enabled = true;
                timeout = 300;
              };

              lock-and-suspend = {
                action = "lock_and_suspend";
                enabled = true;
                timeout = 600;
              };

              screen-off = {
                action = "screen_off";
                enabled = true;
                timeout = 330;
              };
            };
          };

          widget = {
            active_window = {
              display = "icon_only";
              max_length = 40;
              min_length = 0;
            };

            audio_visualizer = {
              bands = 12;
              color_2 = "secondary";
              mirrored = false;
            };

            battery = {
              hide_when_plugged = true;
            };

            input_volume = {
              show_label = false;
            };

            launcher = {
              glyph = "noctalia";
            };

            media = {
              hide_album_art = true;
              hide_when_no_media = true;
              max_length = 512;

              actions = {
                back = "none";
                forward = "none";
                scroll_down = "media next";
                scroll_up = "media previous";
              };
            };

            network = {
              show_label = false;
              vpn_status = "both";
            };

            taskbar = {
              show_active_indicator = false;
              show_window_title = false;
            };

            tray = {
              drawer = true;
              hide_passive = false;
            };

            weather = {
              show_condition = false;
              show_temperature = false;
            };

            workspaces = {
              anchor = true;
              active_pill_size = 2;
              empty_color = "outline";
              focused_color = "tertiary";
              occupied_color = "outline";
              scale = 1.25;
              style = "minimal";
            };
          };

          wallpaper = {
            mode = config.stylix.polarity;
            source = "custom";

            directory = config.stylix.images._farmed;

            default.path = config.stylix.image;
          };
        };
      };
  };
}
