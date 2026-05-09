# WARN:
# unmaintained
# i will never use it again
#
# INFO:
# useful wm
# with various qol things

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
        {
          programs.hyprland.enable = true;

          hm.wayland.windowManager.hyprland = {
            inherit (config.programs.hyprland)
              enable
              ;

            xwayland.enable = true;

            systemd = {
              enable = true;
              variables = [ "--all" ];
            };

            plugins = with pkgs.hyprlandPlugins; [
              hypr-dynamic-cursors
              # hyprgrass
              # hyprsplit
            ];

            settings = {
              plugin = {
                hyprsplit = {
                  num_workspaces = 6;
                  persistent_workspaces = true;
                };

                dynamic-cursors = {
                  enabled = false;

                  mode = "stretch";
                  stretch = {
                    limit = 3000;
                    function = "quadratic";
                    window = 100;
                  };

                  shake.enabled = true;
                };

                touch_gestures = {
                  edge_margin = 10;
                  emulate_touchpad_swipe = false;
                  long_press_delay = 400;
                  sensitivity = 4.0;
                  workspace_swipe_fingers = 3;

                  hyprgrass-bind = [
                    ", edge:l:u, exec, wpctl set-volume -l 2 @DEFAULT_AUDIO_SINK@ 5%+"
                    ", edge:l:d, exec, wpctl set-volume -l 2 @DEFAULT_AUDIO_SINK@ 5%-"

                    ", edge:r:l, workspace, e+1"
                    ", edge:l:r, workspace, e-1"

                    ", swipe:3:d, movetoworkspace, -1"
                    ", swipe:3:u, movetoworkspace, +1"
                  ];

                  hyprgrass-bindm = [
                    ", longpress:2, movewindow"
                    ", longpress:3, resizewindow"
                  ];
                };
              };
            }
            // (import ./settings.nix {
              inherit pkgs lib config;
            })
            // (import ./binds/main.nix {
              inherit pkgs lib config;
            })
            // (import ./rules/main.nix {
              inherit lib config;
            });
          };
        };
    };
}
