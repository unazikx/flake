# INFO:
# beauty lockscreen

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          inputs,
          pkgs,
          lib,
          config,
          ...
        }:
        let
          inherit (config.lib.stylix)
            colors
            ;
        in
        {
          hm = {
            programs.hyprlock = {
              enable = true;

              settings = {
                general = {
                  hide_cursor = true;
                  immediate_render = true;
                };

                background = {
                  color = "rgb(${colors.base03})";
                  blur_passes = 4;
                  blur_size = 12;
                  path = config.stylix.image;
                };

                input-field = {
                  check_color = "rgb(${colors.base0A})";
                  fail_color = "rgb(${colors.base08})";
                  font_color = "rgb(${colors.base05})";
                  inner_color = "rgb(${colors.base00})";
                  outer_color = "rgb(${colors.base01})";
                };

                animations = {
                  bezier = [
                    "easeout, 0.5, 1, 0.9, 1"
                    "easeoutback, 0.34, 1.22, 0.65, 1"
                  ];

                  animation = [
                    "fade,       1, 3, easeout"
                    "fadeOut,    1, 3, easeout"
                    "inputField, 1, 1, easeoutback"
                  ];
                };

                label = [
                  {
                    text = "$TIME";
                    color = "rgb(${colors.base05})";
                    font_family = config.stylix.fonts.monospace.name;
                    font_size = config.stylix.fonts.sizes.applications * 7;
                    text_align = "center";
                    halign = "center";
                    valign = "center";
                    position = "0, ${toString (10 + 2)}%";

                    shadow_passes = 6;
                    shadow_size = 4;
                    shadow_color = "rgb(${colors.base00})";
                  }

                  {
                    text = "󰌌 $LAYOUT";
                    color = "rgb(${colors.base05})";
                    font_family = config.stylix.fonts.sansSerif.name;
                    font_size = config.stylix.fonts.sizes.applications;
                    halign = "left";
                    valign = "bottom";
                    position = "2%, 2%";

                    shadow_passes = 6;
                    shadow_size = 4;
                    shadow_color = "rgb(${colors.base00})";
                  }

                  {
                    text = "cmd[update:1000] ${lib.getExe pkgs.own.hyprlock-battery}";
                    color = "rgb(${colors.base05})";
                    font_family = config.stylix.fonts.sansSerif.name;
                    font_size = config.stylix.fonts.sizes.applications;
                    halign = "center";
                    valign = "bottom";
                    position = "0, 2%";

                    shadow_passes = 6;
                    shadow_size = 4;
                    shadow_color = "rgb(${colors.base00})";
                  }
                ];

                input-field = {

                  outline_thickness = 3;
                  fade_on_empty = true;

                  rounding = 18;
                };
                auth = {
                  pam.enabled = true;
                  fingerprint.enabled = true;
                };
              };
            };

            stylix.targets.hyprlock = {
              enable = false;
              image.enable = false;
            };
          };

          security.pam.services.hyprlock = { };
        };
    };
}
