# INFO:
# tui journal tool
# i dont use it

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          config,
          ...
        }:
        let
          toml = pkgs.formats.toml { };
        in
        {
          hmPackages = [ pkgs.tui-journal ];

          hm.xdg.configFile = {
            "tui-journal/config.toml".source = toml.generate "tjournal" {
              backend_type = "Json";
              sync_os_clipboard = true;
              colored_tags = true;

              external_editor = {
                command = "hx";
                temp_file_extension = "md";
              };

              json_backend.file_path = "${config.hm.xdg.userDirs.documents}/tjdb.json";
            };

            "tui-journal/themes.toml".source =
              with config.lib.stylix.colors.withHashtag;
              toml.generate "tjournal" {
                general = {
                  input_block_active = {
                    fg = "Green";
                  };

                  input_block_invalid = {
                    fg = "Red";
                  };

                  input_corsur_active = {
                    fg = "Black";
                    bg = "White";
                  };

                  input_corsur_invalid = {
                    fg = "Black";
                    bg = "Red";
                  };

                  list_item_selected = {
                    fg = "LightYellow";
                    modifiers = "BOLD";
                  };

                  list_highlight_active = {
                    fg = "Black";
                    bg = "Cyan";
                  };

                  list_highlight_inactive = {
                    fg = "Black";
                    bg = "Cyan";
                  };
                };

                journals_list = {
                  block_active = {
                    fg = "Reset";
                    modifiers = "BOLD";
                  };

                  block_inactive = {
                    fg = base04;
                  };

                  block_multi_select = {
                    fg = "Yellow";
                    modifiers = "BOLD | ITALIC";
                  };

                  highlight_active = {
                    fg = "Black";
                    bg = "Green";
                    modifiers = "BOLD";
                  };

                  highlight_inactive = {
                    fg = "Green";
                    bg = "Black";
                  };

                  title_active = {
                    fg = base04;
                  };

                  title_inactive = {
                    fg = base04;
                  };

                  title_selected = {
                    fg = "Yellow";
                    modifiers = "BOLD";
                  };

                  date_priority = {
                    fg = base04;
                    modifiers = "ITALIC";
                  };

                  tags_default = {
                    fg = "Cyan";
                    bg = "Black";
                    modifiers = "BOLD";
                  };
                };

                editor = {
                  block_insert = {
                    fg = "LightGreen";
                    modifiers = "BOLD";
                  };

                  block_visual = {
                    fg = "Blue";
                    modifiers = "BOLD";
                  };

                  block_normal_active = {
                    fg = "Cyan";
                    modifiers = "BOLD";
                  };

                  block_normal_inactive = {
                    fg = base04;
                  };

                  cursor_normal = {
                    fg = "Black";
                    bg = "White";
                    modifiers = "RAPID_BLINK";
                  };

                  cursor_insert = {
                    fg = "Black";
                    bg = "LightGreen";
                    modifiers = "RAPID_BLINK";
                  };

                  cursor_visual = {
                    fg = "Black";
                    bg = "Yellow";
                    modifiers = "RAPID_BLINK";
                  };

                  selection_style = {
                    fg = "Black";
                    bg = "Yellow";
                  };
                };

                msgbox = {
                  error = "Red";
                  warning = "Yellow";
                  info = "Green";
                  question = "Cyan";
                };
              };
          };
        };
    };
}
