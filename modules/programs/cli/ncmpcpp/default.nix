# INFO:
# good tui client for mpd
#
# WARN:
# lazy to configure bindings... later

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        let
          cfg = config.hm.services.mpd;
        in
        {
          hm.programs.ncmpcpp = {
            enable = true;

            package = pkgs.ncmpcpp.override {
              visualizerSupport = true;
            };

            settings = {
              connected_message_on_startup = false;
              colors_enabled = true;
              mouse_support = false;
              mpd_crossfade_time = 5;

              song_status_format = "$b$7[%t]";
              song_list_format = "$8%t$R  $8%a$R $8%l";

              current_item_prefix = "\"$b$0$2> \"";
              current_item_suffix = "$2$/b$0$8";

              now_playing_prefix = "\"$5= \"";
              now_playing_suffix = "$3";

              song_library_format = "{{%a - %t} (%b)}|{%f}";

              playlist_display_mode = "classic";
              user_interface = "classic";

              volume_color = "yellow";
              progressbar_look = "⎯●⎯";
              progressbar_color = "black";
              progressbar_elapsed_color = "green";

              external_editor = "hx";
              startup_screen = "playlist";
              screen_switcher_mode = lib.concatStringsSep ", " [
                "playlist"
                "browser"
                "visualizer"
                "lyrics"
              ];

              fetch_lyrics_for_current_song_in_background = true;
              lyrics_directory = "${config.hm.home.homeDirectory}/.lyrics";
              lyrics_fetchers = lib.concatStringsSep ", " [
                "genius"
                "internet"
                "jahlyrics"
                "justsomelyrics"
                "plyrics"
                "tags"
                "tekstowo"
                "zeneszoveg"
              ];

              autocenter_mode = true;
              centered_cursor = true;

              visualizer_data_source = "${cfg.dataDir}/visualizer.fifo";
              visualizer_output_name = "MPD Visualizer";
              visualizer_type = "ellipse";
              visualizer_look = "●●";
              visualizer_color = lib.concatStringsSep ", " [
                "red"
                "yellow"
                "green"
                "blue"
                "cyan"
              ];
            };
          };
        };
    };
}
