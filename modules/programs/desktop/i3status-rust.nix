{
  ...
}:

{
  zen.programs.desktop.i3status-rust = {
    description = ''
      simple status for i3/sway
    '';

    homeManagerNixos =
      {
        lib,
        config,
        osConfig,
        ...
      }:
      {
        programs.i3status-rust = {
          enable = true;

          bars = {
            default = {
              blocks = [
                (lib.mkIf config.services.playerctld.enable {
                  block = "music";
                  format = " {$title.str(max_w:50)|} / <i>!$artist</i> $prev $play $next ($volume) ";
                  format_alt = " [$player] $prev $play $next ";
                  click = [
                    {
                      button = "up";
                      action = "volume_up";
                    }
                    {
                      button = "down";
                      action = "volume_down";
                    }
                  ];
                })
                {
                  block = "sound";
                  format = " $icon {$volume.eng(w:2) |}";
                  max_vol = 100;
                }
                {
                  block = "scratchpad";
                }
                {
                  block = "notify";
                  format = " $icon {($notification_count.eng(w:1)) |}";
                }
                {
                  block = "keyboard_layout";
                  driver = "sway"; # only sway fans
                  format = " 󰌌 $layout ";
                  mappings = {
                    "English (US)" = "en";
                    "Russian (N/A)" = "ru";
                  };
                }
                {
                  block = "net";
                  format = " $icon {$nameserver $signal_strength|wired} ";
                  format_alt = " $icon ^icon_net_down$speed_down.eng(prefix:K) / ^icon_net_up$speed_up.eng(prefix:K) ";
                  inactive_format = " $icon down ";
                }
                {
                  block = "time";
                  format = " $icon $timestamp.datetime(f:'%d.%m.%Y / %H:%M') ";
                }
                (lib.mkIf (osConfig.services.upower.enable) {
                  block = "battery";
                  driver = "upower";
                  format = " $icon $percentage ";
                })
                {
                  block = "menu";
                  text = " ⏻ ";
                  items = [
                    {
                      display = " shutdown ";
                      cmd = "systemctl poweroff";
                    }
                    {
                      display = " reboot ";
                      cmd = "systemctl reboot";
                    }
                    {
                      display = " suspend ";
                      cmd = "systemctl suspend";
                    }
                    {
                      display = " logout ";
                      cmd = "loginctl terminate-user $USER";
                    }
                    {
                      display = " lock ";
                      cmd = "loginctl lock-session";
                    }
                  ];
                }
              ];

              settings = {
                theme = {
                  overrides = lib.mkMerge [
                    (
                      let
                        colors = config.lib.stylix.colors.withHashtag;
                      in
                      {
                        idle_bg = colors.base00;
                        idle_fg = colors.base05;
                        info_bg = colors.base00;
                        info_fg = colors.base05;
                        good_bg = colors.base0B;
                        good_fg = colors.base00;
                        warning_bg = colors.base0A;
                        warning_fg = colors.base00;
                        critical_bg = colors.base08;
                        critical_fg = colors.base00;
                        separator_bg = colors.base00;
                        separator_fg = colors.base01;
                      }
                    )
                    {
                      separator = "<span font='12'>|</span>";
                    }
                  ];
                };

                icons.icons = "material-nf";
              };
            };
          };
        };
      };
  };
}
