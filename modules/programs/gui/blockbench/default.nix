# INFO:
# best texture/skin maker
# and minecraft animations

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
          # WARN: it doesnt works

          json = pkgs.formats.json { };
        in
        {
          persist.user.directories = [
            ".local/share/Blockbench/plugins"
          ];

          hm = {
            home.packages = with pkgs; [ blockbench ];

            xdg.configFile = {
              "Blockbench/stylix.bbtheme".source = json.generate "blockbench-theme" {
                name = "Stylix theme (based on Crimson)";
                author = "by Azikx for ${lib.userName}";

                css = "
                  .dialog_sidebar .dialog_sidebar_pages li
                    { padding: 6px 10px; }
                  .dialog_sidebar .dialog_sidebar_pages li.selected
                    { border-style: unset; border-left: 3px solid var(--color-accent); }
                  .dialog_handle
                    { font-size: 1.25em; height: auto; }
                  .dialog_bar > button.confirm_btn:not(:hover)
                    { border: 3px solid var(--color-accent); }
                  #start_files li.format_entry
                    { padding-block: 5px; }
                  .dialog_handle
                    {
                      border-top-left-radius: var(--title_radius);
                      border-top-right-radius: var(--title_radius);
                      background-color: var(--color-back);
                      text-align: center;
                    }
                  #windows_window_menu li, dialog_menu_button, .dialog_close_button,
                  #tab_bar .project_tab:hover .project_tab_close_button,
                  #tab_bar .project_tab.selected .project_tab_close_button,
                  #tab_bar .project_tab .project_tab_close_button.unsaved
                    { display: none; }
                ";

                colors = with config.lib.stylix.colors.withHashtag; {
                  ui = base00;
                  back = base00;
                  dark = base00;
                  border = base02;
                  selected = base03;
                  button = base02;
                  bright_ui = base00;
                  accent = base0D;
                  frame = base00;
                  text = base06;
                  light = base07;
                  accent_text = base00;
                  bright_ui_text = base06;
                  subtle_text = base05;
                  grid = base0E;
                  wireframe = base0D;
                  checkerboard = base02;
                };
              };
            };
          };
        };
    };
}
