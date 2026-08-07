{
  ...
}:

{
  zen.styles.gtk = {
    homeManager =
      {
        lib,
        config,
        ...
      }:
      let
        polarity = config.stylix.polarity;
      in
      {
        gtk =
          lib.genAttrs
            [
              "gtk3"
              "gtk4"
            ]
            (_: {
              extraConfig = {
                gtk-application-prefer-dark-theme = if (polarity == "dark") then 1 else 0;
                gtk-button-images = 0;
                gtk-decoration-layout = "";
                gtk-enable-event-sounds = 0;
                gtk-enable-primary-paste = false;
                gtk-menu-images = 0;
              };
            });

        dconf.settings = {
          "org/gnome/desktop/wm/preferences" = {
            action-right-click-titlebar = "none";
            action-double-click-titlebar = "none";
            action-middle-click-titlebar = "none";
            button-layout = "";
          };

          "org/gnome/desktop/interface" = {
            color-scheme = if (polarity == "dark") then "prefer-dark" else "prefer-light";
          };
        };
      };
  };
}
