{
  ...
}:

{
  zen.programs.editors.zed.settings = {
    description = ''
      just audio visualizer
    '';

    homeManager =
      {
        lib,
        config,
        ...
      }:
      {
        programs.zed-editor = {
          userSettings = lib.mkMerge [
            (lib.genAttrs
              [
                "collaboration_panel"
                "notification_panel"
              ]
              (_: {
                button = false;
              })
            )
            {
              helix_mode = config.programs.helix.enable;
              vim_mode =
                let
                  nvim = config.programs.neovim;
                  vim = config.programs.vim;
                in
                nvim.enable or vim.enable && !config.programs.helix.enable;

              inlay_hints = {
                show_type_hints = true;
                show_parameter_hints = true;
                show_other_hints = true;
                show_background = false;
                edit_debounce_ms = 700;
                scroll_debounce_ms = 50;
                toggle_on_modifiers_press = {
                  control = true;
                };
                show_value_hints = true;
              };

              minimap = {
                show = "never";
              };

              languages = {
                Nix = {
                  language_servers = [
                    "nixd"
                    "!nil"
                  ];
                };
              };

              telemetry = {
                diagnostics = false;
                metrics = false;
              };
            }
          ];
        };
      };
  };
}
