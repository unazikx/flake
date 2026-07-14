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
          homemanager = "marv963.github.io/hm-search/?release=master";
          searchix = "searchix.ovh";
          myNixOS = "mynixos.com";
          nixosWiki = "wiki.nixos.org";
          hydra = "hydra.nixos.org";
          prTracker = "nixpk.gs/pr-tracker.html";
          cachix = "app.cachix.org/cache/xache";
          noogle = "noogle.dev";

          # git
          ultima = "git.sr.ht/~neverness/multi-flake";
          pubSolar = "git.pub.solar/xmozoid/multi-flake";
          github = "github.com";

          # social
          youtube = "www.youtube.com";
          piped = "piped.private.coffee";
          gmail = "mail.google.com";
          safetwitch = "safetwitch.ducks.party";
          redlib = "redlib.thebunny.zone";
          phanpy = "phanpy.social";
          binternet = "binternet.private.coffee";
          pixivfe = "pixivfe.ducks.party";
          mastodonMl = "mastodon.ml";
          nitter = "nitter.net";
          vk = "vk.com";
          dvach = "2ch.su";
          tidalSquid = "tidal.squid.wtf";
          tidalMonochrome = "monochrome.tf";

          # anime etc
          anilist = "anilist.co";
          anichart = "anichart.net";
          anilibria = "anilibria.top";
          animeGo = "animego.club/index";
          anilibMe = "v3.animelib.org";
          yummyAnime = "yummy-anime.org";
          dreamCast = "dreamerscast.com";
          dreamTorr = "195.91.184.178";
          animeVost = "анимевост.рф";
          mangaLib = "mangalib.me/ru";
          urusai = "urusai.social";
          miruro = "miruro.tv";
          animekai = "anikai.to/home";

          # torrents
          rutracker = "rutracker.org";
          rutrackerWiki = "rutracker.wiki";
          pirateBay = "thepiratebay.org";
          pirateBayProxy = "piratebayproxy.net";
          nnmClub = "nnmclub.to";

          # games
          modrinth = "modrinth.com";
          mineWiki = "ru.minecraft.wiki";
          broTorrent = "brotorrent.net";
          smallGames = "small-games.info";
          tuttop = "tuttop.com";
          freeTP = "freetp.org";
          steamDB = "steamdb.info";
          protonDB = "protondb.com";
          gogDB = "www.gogdb.org";
          egsDB = "egdata.app";

          # study
          chatGpt = "chatgpt.com";
          deekpeek = "chat.deepseek.com";
          gemini = "gemini.google.com";
          grok = "grok.com";
          claude = "claude.ai";

          # misc
          base16Preview = "sesh.github.io/base16-viewer";
          translate = "simplytranslate.ducks.party";
          vaultwarden = "vault.vaultwarden.net";
          intellectual = "intellectual.ducks.party";
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
