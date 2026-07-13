{
  ...
}:

{
  zen.programs.gui.blockbench = {
    description = ''
      best texture/skin maker
      and minecraft animations
    '';

    homeManager =
      {
        ...
      }:
      {
        programs.blockbench = {
          enable = true;

          settings = {
            css =
              # css
              ''
                #start_files li.format_entry
                  { padding-block: 5px; }
                .dialog_sidebar .dialog_sidebar_pages li
                  { padding: 6px 10px; }
                .dialog_sidebar .dialog_sidebar_pages li.selected
                  { border-style: unset; border-left: 3px solid var(--color-accent); }
                .dialog_handle
                  { font-size: 1.25em; height: auto; }
                .dialog_bar > button.confirm_btn:not(:hover)
                  { border: 3px solid var(--color-accent); }
                  
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
              '';
          };
        };
      };
  };
}
