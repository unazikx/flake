{
  ...
}:

{
  zen.programs.desktop.mangowc.settings = {
    homeManagerNixos =
      {
        ...
      }:
      {
        wayland.windowManager.mango = {
          settings = {
            border_radius = 12;
            focused_opacity = 1.0;
            unfocused_opacity = 0.9;

            scroller = {
              structs = 32;
              default_proportion = 0.7;
              focus_center = 1;
              prefer_center = 1;
              default_proportion_single = 1.0;
              proportion_preset = "0.5, 0.8, 1.0";
            };

            hotarea_size = 10;
            ov_tab_mode = 1;
            overviewgappi = 12;
            overviewgappo = 12;

            edge_scroller_pointer_focus = 1;
            circle_layout = "scroller, vertical_scroller";

            xkb_rules_layout = "us, ru";
          };
        };
      };
  };
}
