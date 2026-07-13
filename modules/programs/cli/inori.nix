{
  zen,
  ...
}:

{
  zen.programs.cli.inori = {
    description = ''
      cool client for mpd
      imports and mpd itself
    '';

    includes = [
      zen.services.mpd
    ];

    homeManager =
      {
        ...
      }:
      {
        programs.inori = {
          enable = true;

          settings = {
            qwerty_keybindings = true;

            keybindings = {
              # keep-sorted start block=yes newline_separated=yes
              bottom = [ "G" ];

              delete = [
                "d"
                "<backspace>"
              ];

              down = [
                "j"
                "<down>"
              ];

              escape = [ "<esc>" ];

              left = [
                "h"
                "<left>"
              ];

              next_song = [ "N" ];

              previous_song = [ "P" ];

              quit = [ "q" ];

              right = [
                "l"
                "<right>"
              ];

              screen_1 = [
                "1"
                "b"
              ];

              screen_2 = [
                "2"
                "B"
              ];

              screenful_down = [
                "J"
                "<pagedown>"
              ];

              screenful_up = [
                "K"
                "<pageup>"
              ];

              seek = [ ">" ];

              seek_backwards = [ "<" ];

              select = [ "<enter>" ];

              toggle_consume = [ "c" ];

              toggle_playpause = [
                "p"
                "<space>"
              ];

              toggle_random = [ "a" ];

              toggle_repeat = [ "r" ];

              toggle_screen = [ "<tab>" ];

              toggle_single = [ "s" ];

              top = [ "g g" ];

              up = [
                "k"
                "<up>"
              ];
              # keep-sorted end
            };

            theme = {
              # keep-sorted start block=yes newline_separated=yes
              block_active = {
                fg = "White";
              };

              field_album = {
                fg = "Yellow";
              };

              field_artistsort = {
                fg = "Yellow";
              };

              item_highlight_active = {
                fg = "Black";
                bg = "Yellow";
                add_modifier = "BOLD";
              };

              item_highlight_inactive = {
                fg = "White";
                bg = "DarkGray";
              };

              search_query_active = {
                fg = "White";
              };

              search_query_inactive = {
                fg = "DarkGray";
              };

              status_album = {
                fg = "White";
                add_modifier = "ITALIC";
              };

              status_artist = {
                fg = "White";
                add_modifier = "ITALIC";
              };

              status_paused = {
                fg = "White";
              };

              status_playing = {
                fg = "Green";
              };

              status_stopped = {
                fg = "Red";
              };

              status_title = {
                fg = "Green";
                add_modifier = "BOLD";
              };
              # keep-sorted end
            };
          };
        };
      };
  };
}
