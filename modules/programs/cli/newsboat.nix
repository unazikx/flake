{
  ...
}:

{
  zen.programs.cli.newsboat = {
    description = ''
      rss feed reader
      for youtube feeds use pkg yt-id
    '';

    homeManager =
      {
        ...
      }:
      {
        programs.newsboat = {
          enable = true;

          autoReload = true;
          reloadTime = 5;

          urls = [
            {
              url = "https://nixos.org/blog/announcements-rss.xml";
              tags = [
                "linux"
                "nixos"
              ];
            }
            {
              url = "https://weekly.nixos.org/feeds/all.rss.xml";
              tags = [
                "linux"
                "nixos"
              ];
            }
            {
              url = "https://redlib.thebunny.zone/r/ObsidianMD.rss";
              tags = [
                "reddit"
              ];
            }
            {
              url = "https://terminaltrove.com/new.xml";
              tags = [
                "linux"
                "tech"
              ];
            }
            {
              url = "https://terminaltrove.com/blog.xml";
              tags = [
                "linux"
                "tech"
              ];
            }
            {
              url = "https://lobste.rs/t/nix.rss";
              tags = [
                "nixos"
                "tech"
              ];
            }
            {
              url = "https://lobste.rs/rss";
              tags = [
                "nixos"
                "tech"
              ];
            }
            {
              url = "https://nyaa.iss.one/?page=rss";
              tags = [
                "anime"
              ];
            }
            {
              url = "https://readcomicsonline.ru/feed";
              tags = [
                "manga"
                "comics"
                "geek"
              ];
            }
            {
              url = "https://hytracker.net/rss.xml";
              tags = [
                "games"
              ];
            }
            {
              url = "https://feed.rutracker.cc/atom/u/4/64/42166964.atom";
              tags = [
                "games"
                "torrents"
              ];
            }
            {
              url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCB7ukMxILsqKU9SEzH7tvHg";
              tags = [
                "youtube"
              ];
            }
          ];

          extraConfig = ''
            color        article             default    default
            color        background          default    default
            color        info                default    black
            color        listfocus           black      cyan
            color        listfocus_unread    black      cyan
            color        listnormal          default    default
            color        listnormal_unread   default    default

            unbind-key   ENTER
            unbind-key   j
            unbind-key   k
            unbind-key   J
            unbind-key   K

            bind-key     j down
            bind-key     k up
            bind-key     l open
            bind-key     h quit

            bind-key     g home
            bind-key     G end

            bind-key     b bookmark

            bind-key  .  pagedown
            bind-key  ,  pageup
          '';
        };
      };
  };
}
