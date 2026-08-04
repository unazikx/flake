{
  ...
}:

{
  zen.programs.cli.spotatui = {
    description = ''
      tui spotify client
      very simple and useful
    '';

    homeManager =
      {
        ...
      }:
      {
        programs.spotatui = {
          enable = true;

          settings = {
            behavior = {
              enable_global_song_count = false;

              startup_route = "home";

              sidebar_position = "hidden";
              playbar_position = "bottom";
              draw_cover_art = false;

              liked_icon = " 󰋑";
              shuffle_icon = "🔀";
              playing_icon = "▶";
              paused_icon = "⏸";
              gauge_filled_icon = "⣿";
              gauge_unfilled_icon = "⣉";
              active_source_icon = "●";
              episode_played_icon = "✔";
              sort_ascending_icon = "↑";
              sort_descending_icon = "↓";
              list_highlight_icon = "▶";

              seek_milliseconds = 5000;
              shuffle_enabled = true;
              keepawake_enabled = true;

              volume_increment = 10;
              volume_percent = 100;
              visualizer_style = "BarGraph";

              disable_mouse_inputs = true;
              enforce_wide_search_bar = false;
              disable_auto_update = true;

              format = {
                playbar_status = "{state} in {device} | Shuffle: {shuffle} | Repeat: {repeat} | Volume: {volume}%";
              };

              playbar_control_labels = {
                prev = "󰙣 ";
                play_pause = " ";
                next = "󰙡 ";
                shuffle = " ";
                repeat = " ";
                like = "󰋑 ";
                vol_down = "- ";
                vol_up = "+ ";
              };

              keybindings = {
                # https://github.com/LargeModGames/spotatui/wiki/Keybindings
              };
            };
          };
        };
      };
  };
}
