# INFO:
# twitch chat in tui, not viewer
# https://www.twitchchatdownloader.com
#
# WARN:
# server doesnt works idk (russia)

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
        {
          persist.user.directories = [ ];

          hm.programs.twitch-tui = {
            enable = true;

            settings = {
              terminal = {
                delay = 30;
                first_state = "dashboard";
                maximum_messages = 1024 * 4;
              };

              twitch = {
                username = "x_azikx";
                server = "wss://eventsub.wss.twitch.tv/ws";
                token =
                  if (lib.pathExists ./token) then
                    ((n: lib.replaceStrings [ "\n" ] [ "" ] n) (lib.readFile ./token))
                  else
                    "noToken";
                # generate token via
                # https://twitchtokengenerator.com/?scope=chat:read+chat:edit+channel:moderate+user:read:follows+user:read:emotes+user:read:chat+user:write:chat+moderator:manage:chat_messages+moderator:manage:banned_users+moderator:manage:chat_settings+moderator:manage:shoutouts+channel:manage:broadcast+channel:manage:moderators+channel:manage:vips+channel:manage:raids+channel:edit:commercial&auth=auth_stay
              };

              storage = lib.genAttrs [ "channels" "mentions" ] (_n: true);

              frontend = {
                show_datetimes = true;
                datetime_format = "%d/%m %H:%M";
                username_shown = true;
                palette = "pastel";
                title_shown = false;
                margin = 2;
                badges = true;
                theme = config.stylix.polarity;
                username_highlight = true;
                state_tabs = false;
                cursor_shape = "line";
                blinking_cursor = true;
                inverted_scrolling = false;
                show_scroll_offset = true;
                twitch_emotes = true;
                betterttv_emotes = true;
                seventv_emotes = true;
                frankerfacez_emotes = true;
                recent_channel_count = 5;
                border_type = "rounded";
                hide_chat_border = false;
                right_align_usernames = false;
                show_unsupported_screen_size = true;
                only_get_live_followed_channels = false;

                favorite_channels = [ ];
              };
            };
          };
        };
    };
}
