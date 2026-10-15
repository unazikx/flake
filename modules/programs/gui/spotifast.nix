{
  zen,
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   spotifast = {
  #     type = "github";
  #     owner = "crmne";
  #     repo = "spotifast";
  #   };
  #   # keep-sorted end
  # };

  zen.programs.gui.spotifast = {
    description = ''
      egui spotify client
      not electron, faster
    '';

    includes = [
      zen.custom.spotifast
    ];

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.spotifast = {
          enable = true;
          package = pkgs._master.spotifast;

          settings = {
            # keep-sorted start block=yes
            accent_from_art = false;
            art_expanded = false;
            audio_backend = null;
            audio_buffer_ms = 100;
            audio_cache = true;
            audio_cache_mb = 4096;
            audio_device = null;
            autoplay = true;
            balance = 0.0;
            bitrate = 320;
            check_for_updates = true;
            custom_titlebar = false;
            device_name = "Spotifast";
            download_updates_automatically = false;
            eq_shaded = false;
            gapless = true;
            home = {
              made_for_you = {
                visible = true;
              };
              recommendations = {
                visible = true;
              };
            };
            keep_playing_in_background = true;
            language = "system";
            library_by_you = false;
            library_sort = { };
            liked_songs_pinned = true;
            lyrics_width = 360.0;
            mac_notch_widget = false;
            middle_click_autoscroll = false;
            mono = false;
            normalisation = false;
            personal_app_intro_seen = true;
            personal_app_nudge_at = null;
            pinned_contexts = [
              "spotifast:liked-songs"
              "spotify:playlist:37i9dQZEVXbfc3SxVfYQIz"
              "spotify:playlist:37i9dQZEVXcPx0x1MaeSkE"
            ];
            playback_authorized = true;
            player_bar_vis = "off";
            player_bar_vis_click = false;
            playlist_height = 174;
            playlist_open = false;
            playlist_shaded = false;
            queue_width = 280.0;
            search_history = [ ];
            show_shortcut_hints = true;
            sidebar_compact = true;
            sidebar_grid = false;
            sidebar_order = [ ];
            sidebar_visible = true;
            sidebar_width = 210.0;
            skin = null;
            skin_scale = null;
            theme = "system";
            tracklist_compact = false;
            vis = "bars";
            volume = 26214;
            web_client_id = null;
            winamp_on_top = false;
            winamp_shaded = false;
            winamp_show_taskbar = true;
            winamp_window = false;
            zoom = 1.2;
            # keep-sorted end
          };
        };
      };
  };
}
