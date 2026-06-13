# INFO:
# best gui IDE

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
          hm.programs.zed-editor = {
            enable = true;

            extraPackages = pkgs.default-lsp;

            extensions = [
              # keep-sorted start
              "csv"
              "desktop"
              "fish"
              "glsl"
              "go-snippets"
              "html"
              "ini"
              "jq"
              "json5"
              "just"
              "kotlin"
              "latex"
              "lua"
              "markdown-snippets"
              "marksman"
              "material-icon-theme"
              "mdx"
              "nix"
              "nu"
              "todotxt"
              "toml"
              # keep-sorted end
            ];

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
                helix_mode = config.hm.programs.helix.enable;
                vim_mode =
                  config.hm.programs.neovim.enable or config.hm.programs.vim.enable
                  && !config.hm.programs.helix.enable;

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
