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

          extra = {
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
            gtk = {
              gtk3.extraConfig = extra;
              gtk4.extraConfig = extra;
            };

            dconf.settings = {
              "org/gnome/desktop/interface" = {
                color-scheme = polarity "prefer-dark" "prefer-light";
              };
            };
          };
        };
    };
}
