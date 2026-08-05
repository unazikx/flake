{
  ...
}:

{
  zen.programs.desktop.wayshot = {
    description = ''
      simple screenshoter
    '';

    homeManager =
      {
        config,
        ...
      }:
      {
        programs.wayshot = {
          enable = true;

          settings = {
            base = {
              clipboard = true;
              notifications = false;
            };

            file = {
              path = "${config.xdg.userDirs.pictures}/screenshots";
              name_format = "screenshot_%F_%T";
              # ^^^ https://docs.rs/chrono/latest/chrono/format/strftime/index.html
              encoding = "jpg";
            };
          };
        };
      };
  };
}
