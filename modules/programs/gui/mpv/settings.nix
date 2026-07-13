{
  ...
}:

{
  zen.programs.gui.mpv.settings = {
    homeManager =
      {
        ...
      }:
      {
        programs.mpv = {
          config = {
            fs = "yes";
            osc = "no";

            ytdl-format = "bestvideo[height<=?1080][fps<=?60]+bestaudio/best";
            osd-blur = 0.2;
          };

          scriptOpts = {
            sponsorblock-minimal = {
              sponsorblock_minimal-server = "https://sponsor.ajay.app/api/skipSegments";

              sponsorblock_minimal-categories = [
                "selfpromo"
                "sponsor"
              ];
            };

            mpv_thumbnail_script = {
              autogenerate = "yes";
              autogenerate_max_duration = "3600";

              background_color = "000000";
              mpv_no_sub = "no";
              prefer_mpv = "yes";

              thumbnail_count = 150;
              thumbnail_height = 200;
              thumbnail_network = "no";
              thumbnail_width = 200;
            };
          };
        };
      };
  };
}
