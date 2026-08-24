{
  ...
}:

{
  zen.programs.desktop.sway.settings = {
    homeManagerNixos =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
      in
      {
        wayland.windowManager.sway = {
          config = {
            seat."*" = {
              # hide_cursor = mkSeconds 1;
              # hide_cursor = "when-typing enable";
            };

            input = {
              "*" = {
                xkb_layout = "us,ru";
                xkb_options = "grp:caps_toggle";
              };

              "type:touchpad" = {
                tap = "enabled";
              };
            };

            modifier = "Mod4";
            bindkeysToCode = true;
            workspaceAutoBackAndForth = false;

            gaps = {
              inner = 6;
              outer = 2;
              smartBorders = "on";
              smartGaps = true;
            };

            startup = [
              {
                command = lib.getExe pkgs.autotiling-rs;
                always = false;
              }
              {
                command = "AyuGram -startintray";
                always = false;
              }
              {
                command = "vesktop --start-minimized";
                always = false;
              }
            ];

            colors = lib.mkForce {
              background = colors.base00;

              focused = {
                background = colors.base00;
                border = colors.base01;
                childBorder = colors.base01;
                indicator = colors.base01;
                text = colors.base05;
              };

              focusedInactive = {
                background = colors.base00;
                border = colors.base00;
                childBorder = colors.base00;
                indicator = colors.base00;
                text = colors.base05;
              };

              unfocused = {
                background = colors.base00;
                border = colors.base00;
                childBorder = colors.base00;
                indicator = colors.base00;
                text = colors.base05;
              };

              urgent = {
                background = colors.base00;
                border = colors.base08;
                childBorder = colors.base08;
                indicator = colors.base08;
                text = colors.base05;
              };

              placeholder = {
                background = colors.base00;
                border = colors.base01;
                childBorder = colors.base01;
                indicator = colors.base01;
                text = colors.base05;
              };
            };
          };

          extraConfig =
            # sway
            ''
              default_dim_inactive 0.4

              shadows disable
              shadows_on_csd enable
              shadow_color ${colors.base00}
              shadow_blur_radius 12
            '';
        };
      };
  };
}
