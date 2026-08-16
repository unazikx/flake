{
  zen,
  ...
}:

{
  zen.programs.desktop.wayshot = {
    description = ''
      simple screenshoter
    '';

    includes = [
      zen.custom.wayshot
    ];

    homeManager =
      {
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
              name_format = "screenshot_%F_%T";
              # ^^^ https://docs.rs/chrono/latest/chrono/format/strftime/index.html
              encoding = "jpg";
            };
          };
        };
      };
  };
}
