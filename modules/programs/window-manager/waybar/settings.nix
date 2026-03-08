{
  pkgs,
  lib,
  config,
  ...
}:

{
  mainBar =
    let
      mkIcon = col: icon: "<span color='${col}'>${icon}</span>";
      color = config.lib.stylix.colors.withHashtag;

      ico = import ./icons.nix {
        inherit mkIcon color;
      };
      space = (if (lib.configurationName == "pcRyazenka") then " " else (toString null));
    in
    lib.mkMerge [
      {
        start_hidden = false;
        layer = "top";
        position = "left";
        spacing = 16;
        height = 1;

        "custom/spacing" = {
          tooltip = false;
          rotate = 90;

          format = "";
        };
      }
      (
        if (lib.configurationName == "thinkpadT14") then
          {
            modules-left = [
              "custom/spacing"
              "custom/launcher"
              "group/soundGrp"
              "backlight"
              "group/blueGrp"
              "niri/language"
            ];

            modules-center = [ "niri/workspaces" ];

            modules-right = [
              "group/trayGrp"
              "group/dateGrp"
              "battery"
              "custom/power"
              "custom/spacing"
            ];
          }
        else
          {
            modules-left = [
              "custom/spacing"
              "group/musicGrp"
              "group/soundGrp"
              "group/blueGrp"
            ];

            modules-center = [ "niri/workspaces" ];

            modules-right = [
              "group/trayGrp"
              "niri/language"
              "group/dateGrp"
              "custom/spacing"
            ];
          }
      )
      {
        "mpris" = {
          tooltip = false;
          rotate = 90;

          format = " {status_icon} / {player_icon}";
          format-stopped = "";

          max-length = 16;
          scroll-step = 5;
          ellipsis = "…";
          dynamic-separator = " / ";

          dynamic-order = [
            "title"
            "artist"
          ];

          player-icons = {
            default = mkIcon color.base05 "▶ ";
            spotify = mkIcon color.base0B " ";
            mpv = mkIcon color.base0E " ";
            vlc = mkIcon color.base0A "󰕼 ";
            firefox = mkIcon color.base09 " ";
            chromium = mkIcon color.base0D " ";
            mopidy = mkIcon color.base08 " ";
          };

          status-icons = {
            playing = "";
            paused = "";
            stopped = "";
          };
        };

        "custom/power" = {
          tooltip = false;
          rotate = 90;

          format = space + "⏻";
          on-click = "wleave";
        };

        "pulseaudio#volume" = {
          tooltip = false;
          rotate = 90;

          format = "{volume}% ";
          format-muted = "muted ";

          format-bluetooth = "{volume}% ";
          format-bluetooth-muted = "muted ";
        };

        "pulseaudio" = {
          tooltip = false;
          rotate = 90;

          format = "{format_source} / {icon}";
          format-icons = {
            default = [
              ""
              ""
              ""
            ];
            headphone = [ "" ];
            headset = [ "" ];
            bluetooth = "";
            bluetooth-muted = mkIcon color.base04 "󰂲";
          };
          format-muted = "{format_source} / ${mkIcon color.base04 " "}";

          format-source = "󰍬";
          format-source-muted = mkIcon color.base04 "󰍭";

          scroll-step = 5;
          max-volume = 100;
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        };

        "backlight" = {
          tooltip = false;
          rotate = 90;

          device = "intel_backlight";

          format = "{percent}% {icon}";
          format-icons = ico.light;

          on-scroll-up = "${lib.getExe pkgs.brightnessctl} set 1%+";
          on-scroll-down = "${lib.getExe pkgs.brightnessctl} set 1%-";

          on-click = "${lib.getExe pkgs.brightnessctl} set 70%";
          on-click-right = "${lib.getExe pkgs.brightnessctl} set 100%";
        };

        "network" = {
          tooltip = false;
          rotate = 90;

          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-wifi = "{icon} ";
          format-ethernet = "󰈀";
          format-disconnected = "";

          on-click = "nm-applet --indicator";
          on-click-right = "nm-applet";

          interval = 5;
        };

        disk = {
          tooltip = false;
          rotate = 90;

          format = " {used}/{total}";
          path = config.users.users.${lib.userName}.home;
          unit = "GB";

          interval = 30;
        };

        "niri/workspaces" = {
          tooltip = false;
          rotate = 90;

          format = "{icon}";
          format-icons = ico.wm // {
            "active" = "";
          };

          all-outputs = false;
          disable-scroll = false;
          on-click = "activate";

          persistent-workspaces."*" = lib.range 1 10;
        };

        "custom/trayLogo" = {
          tooltip = false;
          rotate = 90;

          format = "󱂫 ";
        };

        "tray" = {
          tooltip = false;
          rotate = 90;

          icon-size = 18;
          show-passive-items = true;
          spacing = 8;
        };

        "bluetooth#name" = {
          tooltip = false;
          rotate = 90;

          format = "{status}";
          format-disabled = "";

          format-connected = "{device_alias}";
          format-connected-battery = "{device_alias} ({device_battery_percentage}%)";

          max-length = 12;

          on-click = lib.getExe pkgs.own.wofi-bluetooth;
          on-click-right = "bluetoothctl disconnect";
        };

        "bluetooth" = {
          tooltip = false;
          rotate = 90;

          format = mkIcon color.base04 "󰂲";
          format-disabled = mkIcon color.base04 "󰂲";

          format-connected = "󰂰 ({num_connections})";
          format-connected-battery = "󰂳 ({num_connections})";

          max-length = 12;

          on-click = lib.getExe pkgs.own.wofi-bluetooth;
          on-click-right = "bluetoothctl disconnect";
        };

        "niri/language" = {
          tooltip = false;
          rotate = 90;

          format = if (lib.configurationName == "pcRyazenka") then "󰌌 {}" else "{} 󰌌";
          format-en = "en";
          format-ru = "ru";

          on-click = "niri msg action switch-layout next";
        };

        "clock#time" = {
          tooltip = false;
          rotate = 90;

          format = " 󰥔 {:%H:%M}";
          format-alt = "  {:%d.%m.%Y}";

          interval = 30;
        };

        "battery" = {
          tooltip = false;
          rotate = 90;

          format = " {icon} {capacity}%";
          format-alt = " {icon} {time}";
          format-charging = "  {capacity}%";
          format-charging-alt = "  {capacity}%";
          format-plugged = "  {capacity}%";
          format-full = " ${mkIcon color.base0B "󱟢"} {capacity}%";
          format-icons = ico.bat;
          format-time = "{H}:{M}";

          states = {
            critical = 15;
            warning = 30;
            good = 95;
          };

          interval = 1;
        };
      }
      (
        let
          mkGroup = drawer: modules: {
            orientation = "inherit";
            inherit
              drawer
              modules
              ;
          };
        in
        {
          "group/soundGrp" =
            mkGroup
              {
                transition-duration = 300;
                children-class = "soundGrp";
                transition-left-to-right = true;
              }
              [
                "pulseaudio"
                "pulseaudio#volume"
              ];

          "group/musicGrp" =
            mkGroup
              {
                transition-duration = 300;
                children-class = "musicGrp";
                transition-left-to-right = true;
              }
              [
                "mpris"
              ];

          "group/blueGrp" =
            mkGroup
              {
                transition-duration = 300;
                children-class = "blueGrp";
                transition-left-to-right = true;
              }
              [
                "bluetooth"
                "bluetooth#name"
              ];

          "group/dateGrp" =
            mkGroup
              {
                transition-duration = 300;
                children-class = "dateGrp";
                transition-left-to-right = false;
              }

              [
                "clock#time"
              ];

          "group/trayGrp" =
            mkGroup
              {
                transition-duration = 300;
                children-class = "trayGrp";
                transition-left-to-right = false;
              }
              [
                "custom/trayLogo"
                "tray"
              ];
        }
      )
      (
        let
          xmlGenerate = name: (pkgs.formats.xml { }).generate "waybar-menu-${name}";
        in
        {
          "custom/powerMenu" = {
            tooltip = false;
            rotate = 90;

            format = "<span color='${color.base0C}' font='17'></span> {}";
            on-click = "tofi-drun | xargs niri msg action spawn --";

            menu = "on-click-right";
            menu-actions = {
              "shutdown" = "systemctl shutdown";
              "reboot" = "systemctl reboot";
              "suspend" = "systemctl suspend";
              "logout" = "loginctl terminate-user $USER";
            };

            menu-file = xmlGenerate "powerMenu" {
              interface.object = {
                "@class" = "GtkMenu";
                "@id" = "menu";
                child = [
                  {
                    object = {
                      "@class" = "GtkMenuItem";
                      "@id" = "shutdown";
                      property = {
                        "@name" = "label";
                        "#text" = "Shutdown";
                      };
                    };
                  }
                  {
                    object = {
                      "@class" = "GtkMenuItem";
                      "@id" = "reboot";
                      property = {
                        "@name" = "label";
                        "#text" = "Reboot";
                      };
                    };
                  }
                  {
                    object = {
                      "@class" = "GtkMenuItem";
                      "@id" = "suspend";
                      property = {
                        "@name" = "label";
                        "#text" = "Suspend";
                      };
                    };
                  }
                  {
                    object = {
                      "@class" = "GtkMenuItem";
                      "@id" = "logout";
                      property = {
                        "@name" = "label";
                        "#text" = "Logout";
                      };
                    };
                  }
                ];
              };
            };
          };
        }
      )
    ];
}
