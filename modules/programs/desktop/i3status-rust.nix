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

        wayland.windowManager.sway.config =
          let
            colors = config.lib.stylix.colors.withHashtag;
            fonts = config.stylix.fonts;
            cfg = config.wayland.windowManager.sway;
            statusCfg = config.programs.i3status-rust;
          in
          {
            bars = [
              {
                id = toString 0;
                position = "bottom";
                mode = "dock";

                command = lib.getExe' cfg.package "swaybar";
                statusCommand =
                  if statusCfg.enable then
                    "${lib.getExe statusCfg.package} ${
                      lib.concatStringsSep "/" [
                        config.xdg.configHome
                        "i3status-rust"
                        "config-default.toml"
                      ]
                    }"
                  else
                    lib.getExe' cfg.package "swaybar";

                trayOutput = "none";

                fonts = {
                  size = toString fonts.sizes.desktop;
                  names = [ fonts.monospace.name ];
                };

                colors = lib.mkForce {
                  background = colors.base00;
                  statusline = colors.base05;

                  activeWorkspace = {
                    background = colors.base01;
                    border = colors.base01;
                    text = colors.base05;
                  };

                  focusedWorkspace = {
                    background = colors.base02;
                    border = colors.base02;
                    text = colors.base04;
                  };

                  inactiveWorkspace = {
                    background = colors.base01;
                    border = colors.base01;
                    text = colors.base03;
                  };

                  urgentWorkspace = {
                    background = colors.base08;
                    border = colors.base01;
                    text = colors.base00;
                  };
                };
              }
            ];
          };
      };
  };
}
