{
  ...
}:

{
  zen.programs.desktop.umbriel.rules = {
    homeManager =
      {
        ...
      }:
      {
        programs.umbriel.settings = {
          window_rule = [
            {
              match.app_id = "^dev.noctalia.Noctalia$";
              default_floating = true;
              default_size = [
                1020
                900
              ];
            }
            {
              match.app_id = "^dev.noctalia.UmbrielSharePicker$";
              default_floating = true;
              default_size = [
                800
                600
              ];
            }
            {
              match.title = "^(Picture-in-Picture|Picture in picture)$";
              default_floating = true;
              default_maximize = false;
              default_position = {
                x = 20;
                y = 20;
                anchor = "bottom_right";
              };
            }

            {
              match.app_id = "^org.qutebrowser.qutebrowser&";
              default_workspace = 2;
            }
            {
              match.app_id = "^spotify&";
              default_workspace = 3;
            }
            {
              match.app_id = "^com.ayugram.desktop&";
              default_workspace = 4;
            }
            {
              match.app_id = "^steam&";
              default_workspace = 5;
            }
          ];

          layer_rule = [
            {
              match = {
                namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd)$";
              };
              blur = false;
              blur_ignore_alpha = 0.5;
              blur_optimized = false;
            }
          ];
        };
      };
  };
}
