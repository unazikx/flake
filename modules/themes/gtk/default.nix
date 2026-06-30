# INFO:
# gtk styling and settings

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          config,
          ...
        }:
        let
          polarity =
            dark: light:
            if (config.stylix.polarity == "dark") then
              dark
            else if (config.stylix.polarity == "light") then
              light
            else
              dark;

          extraConfig = {
            gtk-application-prefer-dark-theme = polarity 1 0;
            gtk-button-images = 0;
            gtk-decoration-layout = "";
            gtk-enable-event-sounds = 0;
            gtk-enable-primary-paste = false;
            gtk-menu-images = 0;
          };
        in
        {
          hm = {
            gtk =
              lib.genAttrs
                [
                  "gtk3"
                  "gtk4"
                ]
                (_: {
                  inherit
                    extraConfig
                    ;
                });

            dconf.settings = {
              "org/gnome/desktop/interface" = {
                color-scheme = if (config.stylix.polarity == "dark") then "prefer-dark" else "prefer-light";
              };
            };
          };
        };
    };
}
