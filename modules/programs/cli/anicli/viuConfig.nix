{
  lib,
  config,
  ...
}:

let
  mkColor = list: lib.concatStringsSep "," list;
in
with config.lib.stylix.colors;

{
  general = {
    desktop_notification_duration = 5;
    preferred_tracker = "remote";
    pygment_style = "native";
    preferred_spinner = "aesthetic";
    media_api = "anilist";
    provider = "allanime";
    selector = "fzf";
    auto_select_anime_result = false;
    icons = true;
    preview = "full";
    preview_scale_up = false;
    image_renderer = "icat";
    manga_viewer = "icat";
    check_for_updates = false;
    update_check_interval = 0.0;
    cache_requests = true;
    max_cache_lifetime = "03:00:00";
    normalize_titles = true;
    discord = true;
    recent = 50;
  };

  stream = {
    player = "mpv";
    quality = "1080";
    translation_type = "sub";
    server = "TOP";
    auto_next = false;
    continue_from_watch_history = true;
    preferred_watch_history = "remote";
    auto_skip = true;
    episode_complete_at = 80;
    ytdlp_format = "best[height<=1080]/bestvideo[height<=1080]+bestaudio/best";
    force_forward_tracking = true;
    default_media_list_tracking = "prompt";
    sub_lang = "ru";
    use_ipc = true;
  };

  downloads = {
    downloader = "auto";
    downloads_dir = "${config.hm.xdg.userDirs.videos}/anime";
    enable_tracking = true;
    max_concurrent_downloads = 3;
    max_retry_attempts = 2;
    retry_delay = 60;
    merge_subtitles = true;
    cleanup_after_merge = true;
    server = "TOP";
    ytdlp_format = "best[height<=1080]/bestvideo[height<=1080]+bestaudio/best";
    no_check_certificate = true;
  };

  anilist = {
    per_page = 15;
    sort_by = "SEARCH_MATCH";
    media_list_sort_by = "MEDIA_POPULARITY_DESC";
    preferred_language = "english";
  };

  fzf = {
    opts = ''
      --border=sharp
      --prompt='>'
      --marker='>'
      --pointer='|>'
      --separator='─'
      --layout=reverse
      --cycle
      --info=hidden
      --height=100%
      --no-margin
      --exact
      --tabstop=1
      --preview-window=border-sharp,left,35%,wrap
      --wrap
      +m
      -i
    '';

    preview_header_color = mkColor [
      base0B-rgb-r
      base0B-rgb-g
      base0B-rgb-b
    ];

    preview_separator_color = mkColor [
      base01-rgb-r
      base01-rgb-g
      base01-rgb-b
    ];

    header_color = mkColor [
      base05-rgb-r
      base05-rgb-g
      base05-rgb-b
    ];

    header_ascii_art = ''
      ██╗░░░██╗██╗██╗░░░██╗
      ██║░░░██║██║██║░░░██║
      ╚██╗░██╔╝██║██║░░░██║
      ░╚████╔╝░██║██║░░░██║
      ░░╚██╔╝░░██║╚██████╔╝
      ░░░╚═╝░░░╚═╝░╚═════╝░
    '';
  };

  media_registry = {
    media_dir = "${config.hm.xdg.userDirs.videos}/anime/.registry";
    index_dir = "${config.hm.xdg.configHome}/viu";
  };

  sessions = {
    dir = "${config.hm.xdg.configHome}/viu/.sessions";
  };
}
