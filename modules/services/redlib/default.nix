# INFO:
# frontend for reddit

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          config,
          ...
        }:
        let
          cfg = config.services.redlib;

          inherit (config.services) caddy;
        in
        {
          services = {
            redlib = {
              enable = true;

              port = 8118;
              address = if caddy.enable then "0.0.0.0" else "127.0.0.1";

              settings = {
                SFW_ONLY = "off";
                ENABLE_RSS = "on";

                THEME = "dark";
                FRONT_PAGE = "default";
                LAYOUT = "card";
                WIDE = "off";
                POST_SORT = "hot";
                COMMENT_SORT = "confidence";
                BLUR_SPOILER = "on";
                SHOW_NSFW = "on";
                BLUR_NSFW = "on";
                USE_HLS = "on";
                HIDE_HLS_NOTIFICATION = "on";
                AUTOPLAY_VIDEOS = "off";
                # SUBSCRIPTIONS = ...;
                HIDE_AWARDS = "on";
                DISABLE_VISIT_REDDIT_CONFIRMATION = "on";
                HIDE_SCORE = "off";
                HIDE_SIDEBAR_AND_SUMMARY = "off";
                FIXED_NAVBAR = "on";
                REMOVE_DEFAULT_FEEDS = "off";
              };
            };

            caddy.virtualHosts =
              lib.genAttrs
                [
                  "redlib.${lib.hostName}.local"
                ]
                (_: {
                  extraConfig = ''
                    encode zstd gzip
                    reverse_proxy http://${cfg.address}:${toString cfg.port}
                  '';
                });
          };
        };
    };
}
