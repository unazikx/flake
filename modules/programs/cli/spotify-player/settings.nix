{
  pkgs,
  lib,
  config,
  ...
}:

{
  settings = {
    client_port = 8080;
    client_id_command = lib.concatStringsSep " " [
      "cat"
      config.sopsnix."tokens/spotify-player"
    ];

    playback_format = ''
      {status} {track} - {artists} {liked}
      {album} • {genres}
      {metadata}
    '';

    playback_metadata_fields = [
      "repeat"
      "shuffle"
      "volume"
      "device"
    ];

    notify_timeout_in_secs = 0;
    notify_transient = false;
    tracks_playback_limit = 50;
    app_refresh_duration_in_ms = 32;
    playback_refresh_duration_in_ms = 0;
    page_size_in_rows = 20;
    play_icon = "";
    pause_icon = "";
    liked_icon = " ";
    explicit_icon = "(E)";
    border_type = "Rounded";
    progress_bar_type = "Rectangle";
    progress_bar_position = "Bottom";
    genre_num = 2;
    cover_img_length = 9;
    cover_img_width = 5;
    cover_img_scale = 1.0;
    cover_img_pixels = 8;
    enable_media_control = true;
    enable_streaming = "Always";
    enable_notify = true;
    enable_cover_image_cache = true;
    notify_streaming_only = false;
    seek_duration_secs = 5;
    sort_artist_albums_by_type = false;

    notify_format = {
      summary = "{track} • {artists}";
    };

    copy_command = {
      command = lib.getExe' pkgs.wl-clipboard "wl-copy";
      args = [ ];
    };

    layout = {
      playback_window_position = "Bottom";
      playback_window_height = 6;
      library = {
        playlist_percent = 40;
        album_percent = 40;
      };
    };
  };

  themes = [
    {
      name = "stylix";

      palette = with config.lib.stylix.colors.withHashtag; {
        background = base00;
        foreground = base05;
        black = base00;
        red = base08;
        green = base0B;
        yellow = base0A;
        blue = base0D;
        magenta = base0E;
        cyan = base0C;
        white = base05;
        bright_black = base03;
        bright_red = base08;
        bright_green = base0B;
        bright_yellow = base0A;
        bright_blue = base0D;
        bright_magenta = base0E;
        bright_cyan = base0C;
        bright_white = base07;
      };

      component_style = {
        block_title = {
          fg = "BrightGreen";
          modifiers = [
            "Italic"
            "Bold"
          ];
        };

        like = {
          fg = "Red";
          modifiers = [ "Bold" ];
        };

        playback_track = {
          fg = "BrightYellow";
          modifiers = [ "Italic" ];
        };

        playback_album = {
          fg = "BrightYellow";
          modifiers = [ "Italic" ];
        };

        playback_artists = {
          fg = "BrightGreen";
          modifiers = [ ];
        };

        playback_metadata = {
          fg = "BrightBlue";
          modifiers = [ ];
        };

        playback_progress_bar = {
          fg = "BrightWhite";
          modifiers = [ "Italic" ];
        };

        current_playing = {
          fg = "Red";
          modifiers = [
            "Bold"
            "Italic"
          ];
        };

        playlist_desc = {
          fg = "White";
          modifiers = [ "Italic" ];
        };

        page_desc = {
          fg = "White";
          modifiers = [
            "Bold"
            "Italic"
          ];
        };

        table_header = {
          fg = "White";
          modifiers = [ "Italic" ];
        };

        border = {
          fg = "White";
        };

        selection = {
          fg = "Red";
          modifiers = [
            "Bold"
            "Reversed"
          ];
        };

        secondary_row = {
          bg = "BrightBlack";
        };
      };
    }
  ];
}
