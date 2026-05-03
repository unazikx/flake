# INFO:
# good...goon

{
  flake =
    {
      _config,
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        {
          imports = lib.attrValues {
            inherit (_config.nixosModules)
              # keep-sorted start
              i3status-rust
              swayidle
              swaylock
              # keep-sorted end
              ;
          };

          hm.wayland.windowManager.sway = {
            enable = true;
            xwayland = true;
            systemd.enable = true;

            package = pkgs.swayfx;

            config = (
              import ./settings.nix {
                inherit
                  pkgs
                  lib
                  config
                  ;
              }
            );

            extraConfig =
              with config.lib.stylix.colors.withHashtag;
              # sway
              ''
                corner_radius 10

                blur enable
                blur_xray off

                shadows disable
                shadows_on_csd enable
                shadow_color ${base00}
                shadow_blur_radius 12

                default_dim_inactive 0.4
                layer_effects "waybar" shadows disable; corner_radius 0; blur disable
              '';

            checkConfig = false;
          };
        };
    };
}
