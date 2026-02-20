{
  pkgs,
  lib,
  config,
  ...
}:

{
  mainBar =
    let
      mkTooltip = {
        tooltip = false;
        rotate = 90;
      };

      ico = import ./icons.nix;
      space = (if (lib.configurationName == "pcRyazenka") then " " else (toString null));
    in
    lib.mkMerge [
      {
        start_hidden = false;
        layer = "top";
        position = "left";
        spacing = 16;
        height = 1;

        "custom/spacing" = mkTooltip // {
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
              "custom/launcher"
              "group/soundGrp"
              "group/blueGrp"
            ];

            modules-center = [ "niri/workspaces" ];

            modules-right = [
              "group/trayGrp"
              "niri/language"
              "group/dateGrp"
              "custom/power"
              "custom/spacing"
            ];
          }
      )
      {
        "custom/launcher" = mkTooltip // {
          format = "<span color='${config.lib.stylix.colors.withHashtag.base0C}' font='17'></span> {}";

          on-click = "tofi-drun | xargs niri msg action spawn --";
        };

        "custom/power" = mkTooltip // {
          format = space + "⏻";
          on-click = "wleave";
        };

        "pulseaudio#volume" = mkTooltip // {
          format = "{volume}% ";
          format-muted = "muted ";

          format-bluetooth = "{volume}% ";
          format-bluetooth-muted = "muted ";
        };

        "pulseaudio" = mkTooltip // {
          format = "{format_source} / {icon}";
          format-icons = {
            default = [
              " "
              " "
              " "
            ];
            headphone = [ "" ];
            headset = [ "" ];
            bluetooth = "";
            bluetooth-muted = "󰂲";
          };
          format-muted = "{format_source} /  ";

          format-source = "󰍬";
          format-source-muted = "󰍭";

          scroll-step = 5;
          max-volume = 100;
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        };

        "backlight" = mkTooltip // {
          device = "intel_backlight";

          format = "{percent}% {icon}";
          format-icons = ico.light;

          scroll-step = 1;
          on-click = "light -S 70";
          on-click-right = "light -S 100";
        };

        "network" = mkTooltip // {
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

        disk = mkTooltip // {
          format = " {used}/{total}";
          path = config.users.users.${lib.userName}.home;
          unit = "GB";

          interval = 30;
        };

        "niri/workspaces" = mkTooltip // {
          format = "{icon}";
          format-icons = ico.wm // {
            "active" = "";
          };

          all-outputs = false;
          disable-scroll = false;
          on-click = "activate";

          persistent-workspaces."*" = lib.range 1 10;
        };

        "custom/trayLogo" = mkTooltip // {
          rotate = 90;
          format = "󱂫 ";
        };

        "tray" = mkTooltip // {
          icon-size = 18;
          show-passive-items = true;
          spacing = 8;
        };

        "bluetooth#name" = mkTooltip // {
          format = "{status}";
          format-disabled = "";

          format-connected = "{device_alias}";
          format-connected-battery = "{device_alias} ({device_battery_percentage}%)";

          on-click = lib.getExe pkgs.own.wofi-bluetooth;
          on-click-right = "bluetoothctl disconnect";
        };

        "bluetooth" = mkTooltip // {
          format = "󰂲";
          format-disabled = "󰂲";

          format-connected = "󰂰 ({num_connections})";
          format-connected-battery = "󰂳 ({num_connections})";

          on-click = lib.getExe pkgs.own.wofi-bluetooth;
          on-click-right = "bluetoothctl disconnect";
        };

        "niri/language" = mkTooltip // {
          format = if (lib.configurationName == "pcRyazenka") then "󰌌 {}" else "{} 󰌌";
          format-en = "en";
          format-ru = "ru";

          on-click = "niri msg action switch-layout next";
        };

        "clock#date" = mkTooltip // {
          format = " {:%d.%m.%Y} ";

          interval = ((60 * 60) * 2);
        };

        "clock#time" = mkTooltip // {
          format = "󰥔 {:%H:%M}";

          interval = 1;
        };

        "battery" = mkTooltip // {
          format = " {icon} {capacity}%";
          format-alt = " {icon} {time}";
          format-charging = "  {capacity}%";
          format-charging-alt = "  {capacity}%";
          format-plugged = "  {capacity}%";
          format-full = " 󱟢 {capacity}%";
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
    ];
}
