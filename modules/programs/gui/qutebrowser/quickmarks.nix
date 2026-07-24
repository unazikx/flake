{
  ...
}:

{
  zen.programs.gui.qutebrowser.quickmarks = {
    homeManager =
      {
        lib,
        ...
      }:
      {
        programs.qutebrowser.quickmarks = lib.mapAttrs (_: value: "https://${value}") {
          # nix
          nixpkgs = "search.nixos.org/packages?channel=unstable";
          nixSearch = "nixsearch.thekoppe.com";
          nixosWiki = "wiki.nixos.org";
          prTracker = "nixpk.gs/pr-tracker.html";
          noogle = "noogle.dev";

          # git
          github = "github.com";

          # social
          youtube = "www.youtube.com";
          gmail = "mail.google.com";
          dvach = "2ch.su";

          # anime etc
          anilist = "anilist.co";
          anichart = "anichart.net";
          anilibria = "anilibria.top";
          animeGo = "animego.club/index";
          yummyAnime = "yummy-anime.org";
          dreamCast = "dreamerscast.com";
          miruro = "miruro.tv";
          anikai = "anikai.ro/home";

          # torrents
          rutracker = "rutracker.org";
          pirateBay = "thepiratebay.org";
          pirateBayProxy = "piratebayproxy.net";
          broTorrent = "brotorrent.net";
          smallGames = "small-games.info";
          tuttop = "tuttop.com";
          freeTP = "freetp.org";

          # games
          modrinth = "modrinth.com";
          mineWiki = "ru.minecraft.wiki";
          steamDB = "steamdb.info";
          protonDB = "protondb.com";
          gogDB = "www.gogdb.org";
          egsDB = "egdata.app";

          # study
          chatGpt = "chatgpt.com";
          deekpeek = "chat.deepseek.com";
          claude = "claude.ai";
        };
      };

    homeManagerNixos =
      {
        lib,
        osConfig,
        ...
      }:
      {
        programs.qutebrowser = {
          quickmarks = lib.mkIf osConfig.services.caddy.enable (
            lib.mapAttrs (_: value: "https://${value}") (
              lib.listToAttrs (
                map (
                  domain:
                  let
                    withoutSuffix = lib.head (builtins.split "\\.jetpure\\.local" domain);
                    withUnderscores = lib.replaceStrings [ "." ] [ "_" ] withoutSuffix;
                  in
                  {
                    name = "_${withUnderscores}Local";
                    value = domain;
                  }
                ) (lib.attrNames osConfig.services.caddy.virtualHosts)
              )
            )
          );
        };
      };
  };
}
