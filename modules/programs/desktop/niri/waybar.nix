{
  ...
}:

{
  zen.programs.desktop.niri.waybar = {
    homeManager =
      {
        inputs',
        pkgs,
        lib,
        config,
        ...
      }:
      {
        programs.waybar =
          let
            colors = config.lib.stylix.colors.withHashtag;
            fonts = config.stylix.fonts;
            icon = col: icon: "<span color='${col}'>${icon}</span>";
          in
          {
            # systemd.targets = [ "niri.service" ];

            settings.main = {
              modules-left = [
                "custom/spacing"
                "custom/powerMenu"
                "group/musicGrp"
                "group/soundGrp"
                "group/blueGrp"
              ];

              modules-center = [ "niri/workspaces" ];

              modules-right = [
                "group/trayGrp"
                "custom/dunst"
                "niri/language"
                "group/dateGrp"
                "custom/spacing"
              ];

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

              "mpris" = {
                tooltip = false;
                rotate = 90;

                format = "{player_icon}";
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
                  default = icon colors.base05 "▶";
                  spotify = icon colors.base0B "";
                  mpv = icon colors.base0E "";
                  vlc = icon colors.base0A "󰕼";
                  firefox = icon colors.base09 "";
                  chromium = icon colors.base0D "";
                  mopidy = icon colors.base08 "";
                  "org.mpris.MediaPlayer2.cliamp" = icon colors.base0F "󰁧";
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

                format = "⏻";
                on-click = "wleave";
              };

              "pulseaudio#volume" = {
                tooltip = false;
                rotate = 90;

                format = "{volume}%";
                format-muted = "muted";

                format-bluetooth = "{volume}%";
                format-bluetooth-muted = "muted";
              };

              "pulseaudio" = {
                tooltip = false;
                rotate = 90;

                format = "{format_source}/{icon}";
                format-icons = {
                  default = [
                    ""
                    ""
                    ""
                  ];
                  headphone = [ "" ];
                  headset = [ "" ];
                  bluetooth = "";
                  bluetooth-muted = icon colors.base04 "󰂲";
                };
                format-muted = "{format_source}/${icon colors.base04 ""}";

                format-source = "󰍬";
                format-source-muted = icon colors.base04 "󰍭";

                scroll-step = 5;
                max-volume = 100;
                on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
              };

              "backlight" = {
                tooltip = false;
                rotate = 90;

                device = "intel_backlight";

                format = "{percent}%{icon}";
                format-icons = [
                  "󱩎"
                  "󱩏"
                  "󱩐"
                  "󱩑"
                  "󱩒"
                  "󱩓"
                  "󱩔"
                  "󱩕"
                  "󱩖"
                  "󰛨"
                ];

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
                format-wifi = "{icon}";
                format-ethernet = "󰈀";
                format-disconnected = "";

                on-click = "nm-applet --indicator";
                on-click-right = "nm-applet";

                interval = 5;
              };

              disk = {
                tooltip = false;
                rotate = 90;

                format = "{used}/{total}";
                path = config.users.users.${lib.userName}.home;
                unit = "GB";

                interval = 30;
              };

              "niri/workspaces" = {
                tooltip = false;
                rotate = 90;

                format = "{icon}";
                format-icons = {
                  "active" = "";
                  "1" = "一";
                  "2" = "二";
                  "3" = "三";
                  "4" = "四";
                  "5" = "五";
                  "6" = "六";
                  "7" = "七";
                  "8" = "八";
                  "9" = "九";
                  "10" = "十";
                };

                all-outputs = false;
                disable-scroll = false;
                on-click = "activate";

                persistent-workspaces."*" = lib.range 1 10;
              };

              "custom/trayLogo" = {
                tooltip = false;
                rotate = 90;

                format = "󱂫";
              };

              "tray" = {
                tooltip = false;
                rotate = 90;

                icon-size = 18;
                show-passive-items = true;
                spacing = 8;
              };

              "custom/dunst" = {
                tooltip = false;
                rotate = 90;

                on-click = "dunstctl set-paused toggle";
                restart-interval = 1;

                exec = lib.getExe (
                  pkgs.writeShellScriptBin "dunst-toggler.sh" ''
                    COUNT=$(dunstctl count waiting)
                    ENABLED=󰂚 ; DISABLED=󰂛
                    if [ $COUNT != 0 ]; then DISABLED=" $COUNT"; fi
                    if dunstctl is-paused | grep -q "false" ; then echo $ENABLED; else echo $DISABLED; fi
                  ''
                );
              };

              "bluetooth#name" = {
                tooltip = false;
                rotate = 90;

                format = "{status}";
                format-disabled = "";

                format-connected = "{device_alias}";
                format-connected-battery = "{device_alias} ({device_battery_percentage}%)";

                max-length = 12;

                on-click = lib.getExe inputs'.myown.legacyPackages.wofi-bluetooth;
                on-click-right = "bluetoothctl disconnect";
              };

              "bluetooth" = {
                tooltip = false;
                rotate = 90;

                format = icon colors.base04 "󰂲";
                format-disabled = icon colors.base04 "󰂲";

                format-connected = "󰂰 ({num_connections})";
                format-connected-battery = "󰂳 ({num_connections})";

                max-length = 12;

                on-click = lib.getExe inputs'.myown.legacyPackages.wofi-bluetooth;
                on-click-right = "bluetoothctl disconnect";
              };

              "niri/language" = {
                tooltip = false;
                rotate = 90;

                format = if (lib.configurationName == "pcRyazenka") then "󰌌{}" else "{}󰌌";
                format-en = "en";
                format-ru = "ru";

                on-click = "niri msg action switch-layout next";
              };

              "clock#time" = {
                tooltip = false;
                rotate = 90;

                format = "󰥔 {:%H:%M}";
                format-alt = " {:%d.%m.%Y}";

                interval = 30;
              };

              "battery" = {
                tooltip = false;
                rotate = 90;

                format = "{icon}{capacity}%";
                format-alt = "{icon}{time}";
                format-charging = "{capacity}%";
                format-charging-alt = "{capacity}%";
                format-plugged = "{capacity}%";
                format-full = "${icon colors.base0B "󱟢"} {capacity}%";
                format-time = "{H}:{M}";
                format-icons = [
                  (icon colors.base08 "󰁺")
                  (icon colors.base08 "󰁻")
                  (icon colors.base09 "󰁼")
                  (icon colors.base09 "󰁽")
                  (icon colors.base08 "󰁾")
                  (icon colors.base08 "󰁿")
                  (icon colors.base0C "󰂀")
                  (icon colors.base0C "󰂁")
                  (icon colors.base0B "󰂂")
                  (icon colors.base0B "󰁹")
                ];

                states = {
                  critical = 15;
                  warning = 30;
                  good = 95;
                };

                interval = 1;
              };
            };

            style =
              let
                rounding = (toString 14) + "px";
              in
              # css
              ''
                * {
                  font-family: "${fonts.monospace.name}";
                  font-weight: bold;
                  font-size: ${toString (fonts.sizes.applications + 4)}px;
                }

                window#waybar {
                  background-color: ${colors.base00};
                  color: ${colors.base05};
                }

                window#waybar > box {
                  margin: 5px 0px 0px 0px;
                  background-color: ${colors.base00};
                  border-right: 3px solid ${colors.base01};
                }

                /* workspaces */
                #workspaces button {
                  background-color: ${colors.base02};
                  border-radius: ${rounding};
                  margin: 4px;
                  padding: 2px;
                  color: ${colors.base05};
                  min-height: 32px;
                  transition: all 0.4s ease-in-out;
                }

                #workspaces button label {
                  color: ${colors.base05};
                  font-weight: bolder;
                }

                #workspaces button.empty {
                  background: ${colors.base01};
                }

                #workspaces button.active {
                  background: radial-gradient(circle,
                    ${colors.base0C} 0%,
                    ${colors.base0E} 50%,
                    ${colors.base0D} 100%
                  );
                  background-size: 400% 400%;
                  animation: gradient 5s linear infinite;
                  transition: all 0.3s ease-in-out;
                  border-color: ${colors.base00};
                }

                #workspaces button.active label {
                  color: ${colors.base00};
                  font-weight: bolder;
                }

                @keyframes gradient {
                  0% { background-position: 0px 50px; }
                  50% { background-position: 100px 30px; }
                  100% { background-position: 0px 50px; }
                }

                /* modules */
                #backlight,
                #battery,
                #clock,
                #custom-date,
                #custom-launcher,
                #custom-power,
                #custom-separator
                #language,
                #pulseaudio,
                #text,
                #window,
                #workspaces

                #backlight,
                #bluetooth,
                #battery,
                #cava,
                #clock,
                #custom-date,
                #custom-launcher,
                #custom-power,
                #custom-separator,
                #disk,
                #language,
                #network,
                #pulseaudio,
                #tray {
                  color: ${colors.base05};
                  background-color: ${colors.base00};
                  padding: 0 0.4em;
                  padding-top: 0px;
                  padding-bottom: 2px;
                  border-style: solid;
                  min-height: 30px;
                }

                #workspaces {
                  margin: 3 0 3 0px;
                  border-radius: 14 14 14 14px;
                }
              '';
          };
      };
  };
}
