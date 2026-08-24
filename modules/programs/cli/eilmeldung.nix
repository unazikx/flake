{
  zen,
  ...
}:

{
  zen.programs.cli.eilmeldung = {
    description = ''
      rss feed reader
      idk yet another
    '';

    includes = [
      zen.custom.eilmeldung
    ];

    homeManager =
      {
        ...
      }:
      {
        programs.eilmeldung = {
          enable = true;

          settings = {
            # keep-sorted start block=yes newline_separated=yes
            auto_scrape = true;

            border_theme = {
              focused = "rounded";
              unfocused = "rounded";
              framing = "connected";
            };

            icon_set.preset = "nerd";

            keep_articles_days = 14;

            mouse_support = false;

            notify_after_sync = true;

            shadows = true;

            sync_every_minutes = 5;
            # keep-sorted end
          };
        };
      };
  };
}
