{
  ...
}:

{
  zen.programs.desktop.niri.rules = {
    homeManager =
      {
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
      in
      {
        programs.niri = {
          settings.window-rules = [
            {
              opacity = 0.6;
              draw-border-with-background = true;
              matches = [
                {
                  is-focused = false;
                }
              ];
            }
            {
              open-maximized = false;
              open-fullscreen = false;
            }
            {
              open-on-workspace = toString 2;
              matches = [ { app-id = "^*.qutebrowser.*$"; } ];
            }
            {
              open-on-workspace = toString 2;
              matches = [ { app-id = "librewolf"; } ];
            }
            {
              open-on-workspace = toString 3;
              matches = [ { app-id = "spotify"; } ];
            }
            {
              open-on-workspace = toString 4;
              matches = [ { app-id = "^*.ayugram.*$"; } ];
            }
            {
              open-on-workspace = toString 4;
              matches = [ { app-id = "equibop"; } ];
            }
            {
              open-on-workspace = toString 4;
              matches = [ { app-id = "mumble"; } ];
            }
            {
              open-on-workspace = toString 5;
              matches = [ { app-id = "^steam$"; } ];
            }
            {
              open-on-workspace = toString 5;
              matches = [ { app-id = "^HytaleClient$"; } ];
            }
            {
              default-column-width.proportion = 0.5;
              matches = [
                {
                  app-id = "kitty_small";
                }
                {
                  app-id = "foot_small";
                }
              ];
            }
            {
              default-column-width.proportion = 0.5;
              block-out-from = "screen-capture";
              matches = [
                { title = ".*1Password.*"; }
                { title = ".*Bitwarden.*"; }
                { title = ".*KeePassXC.*"; }
              ];
            }
            {
              open-floating = true;
              open-focused = true;
              block-out-from = "screen-capture";
              default-column-width.fixed = 501;
              default-window-height.fixed = 1041;
              matches = [
                {
                  app-id = "^org.keepassxc.KeePassXC&";
                  title = "^Generate Password";
                }
              ];
            }
            {
              open-floating = true;
              open-focused = true;
              block-out-from = "screen-capture";
              default-column-width.proportion = 0.4;
              default-window-height.proportion = 0.4;
              matches = [
                {
                  app-id = "^org.keepassxc.KeePassXC&";
                  title = "^Unlock Database";
                }
              ];
            }
            {
              open-floating = true;
              geometry-corner-radius = {
                top-left = 4.0;
                top-right = 4.0;
                bottom-left = 4.0;
                bottom-right = 4.0;
              };
              border = {
                active.color = colors.base08;
                inactive.color = colors.base08;
                urgent.color = colors.base08;
              };
              matches = [
                {
                  app-id = "^dragon-drop$";
                }
              ];
            }
            {
              open-floating = true;
              default-column-width.fixed = 360;
              default-window-height.fixed = 640;
              matches = [
                {
                  app-id = "^firefox$";
                  title = "^Picture-in-Picture";
                }
                {
                  app-id = "librewolf";
                  title = "^Picture-in-Picture";
                }
              ];
            }
            {
              block-out-from = "screencast";
              matches = [
                {
                  app-id = "^*ayugram*$";
                }
              ];
            }
            {
              open-fullscreen = true;
              matches = [
                {
                  app-id = "^HytaleClient$";
                }
                {
                  app-id = "^swayimg$";
                }
                {
                  app-id = "ayugram";
                  title = "Media viewer";
                }
              ];
            }
            {
              default-column-width.fixed = 470;
              default-window-height.fixed = 960;
              matches = [
                {
                  app-id = "^wofi$";
                  title = "^Bluetooth$";
                }
              ];
            }
            {
              default-column-width.proportion = 0.7;
              default-window-height.proportion = 0.7;
              matches = [
                {
                  app-id = "^org.prismlauncher.PrismLauncher$";
                  title = "^New Instance";
                }
              ];
            }
            {
              default-column-width.proportion = 0.3;
              matches = [
                {
                  app-id = "^steam$";
                  title = "^Friends List$";
                }
              ];
            }
            {
              open-focused = false;
              clip-to-geometry = true;
              geometry-corner-radius = {
                top-left = 4.0;
                top-right = 4.0;
                bottom-left = 4.0;
                bottom-right = 4.0;
              };
              default-floating-position = {
                x = -10;
                y = -10;
                relative-to = "bottom-right";
              };
              matches = [
                {
                  app-id = "^steam$";
                  title = "^notificationtoasts_\\d+_desktop$";
                }
              ];
            }
          ];
        };
      };
  };
}
