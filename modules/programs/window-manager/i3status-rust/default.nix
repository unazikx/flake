# INFO:
# simple status for i3/sway

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          config,
          ...
        }:
        {
          hm.programs.i3status-rust = {
            enable = true;

            bars = {
              default = {
                blocks = [
                  {
                    block = "music";
                    format = " {$title.str(max_w:50)|} / <i>!$artist</i> $prev $play $next ";
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
                  }
                  {
                    block = "sound";
                    format = " $icon {$volume.eng(w:2)|} ";
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
                    block = "time";
                    format = " $icon $timestamp.datetime(f:'%d.%m.%Y / %H:%M') ";
                  }
                  {
                    block = "battery";
                    driver = "upower";
                    format = " $icon $percentage ";
                  }
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
                      (with config.lib.stylix.colors.withHashtag; {
                        idle_bg = base00;
                        idle_fg = base05;

                        info_bg = base00;
                        info_fg = base05;

                        good_bg = base0B;
                        good_fg = base00;

                        warning_bg = base0A;
                        warning_fg = base00;

                        critical_bg = base08;
                        critical_fg = base00;

                        separator_bg = base00;
                        separator_fg = base01;
                      })
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
