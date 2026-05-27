# INFO:
# good...goon

{
  flake =
    {
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
        let
          cfg = config.hm.wayland.windowManager.sway;
        in
        {
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

            extraSessionCommands = with config.lib.stylix.colors; ''
              export GRIMSHOT_SLURP_BACKGROUND = "${base00}CC"
              export GRIMSHOT_SLURP_COLOR      = "${base08}FF"
              export GRIMSHOT_SLURP_BORDER     = "${base02}CC"
            '';

            checkConfig = false;
          };

          services = {
            gnome.gnome-keyring.enable = lib.mkForce false;

            greetd.settings = {
              initial_session = {
                user = lib.userName;
                command = lib.getExe cfg.package;
              };
            };
          };
        };
    };
}
