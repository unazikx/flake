{
  ...
}:

{
  zen.programs.desktop.umbriel.rules = {
    homeManager =
      {
        lib,
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
              match.app_id = "org.qutebrowser.qutebrowser";
              default_workspace = 2;
            }
            {
              match.app_id = "spotify";
              default_workspace = 3;
            }
            {
              match.app_id = lib.concatStringsSep "|" [
                "com.ayugram.desktop"
                "io.github.tdesktop_x64.TDesktop"
              ];
              default_workspace = 4;
            }
            {
              match.app_id = "steam";
              default_workspace = 5;
            }
            {
              match = {
                app_id = "steam";
                title = "Friends List";
              };
              # default_scrolling_extent = 0.3;
              default_workspace = 5;
            }
          ];

          layer_rule = [
            {
              match = {
                namespace = "^noctalia-";
              };
              blur = true;
              blur_popups = true;
              blur_optimized = true;
              blur_ignore_alpha = 0.5;
            }
          ];
        };
      };
  };
}
