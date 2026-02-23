{
  lib,
  config,
  ...
}:

{
  quickmarks = lib.mkMerge [
    {
      # localhost
      keenWeb = "192.168.1.1";
      flood = "localhost:8113";
      transmission = "localhost:9091";
      torrserver = "localhost:8223";
      syncthing = "localhost:8384";
    }
    (lib.mapAttrs (name: value: "https://${value}") {
      # nix
      nixpkgs = "search.nixos.org/packages?channel=unstable";
      homemanager = "home-manager-options.extranix.com/?query=&release=master";
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
      nitter = "nitter.net"; # neck hurt
      vk = "vk.com";
      dvach = "2ch.su"; # zloba >:(

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
      rutracker = "rutracker.org"; # ye
      rutrackerWiki = "rutracker.wiki";
      pirateBay = "thepiratebay.org";
      pirateBayProxy = "piratebayproxy.net";
      nnmClub = "nnmclub.to";

      # games
      modrinth = "modrinth.com";
      mineWiki = "ru.minecraft.wiki"; # i playing 10y along
      broTorrent = "brotorrent.net";
      smallGames = "small-games.info";
      tuttop = "tuttop.com";
      freeTP = "freetp.org";
      steamDB = "steamdb.info";
      protonDB = "protondb.com";
      gogDB = "www.gogdb.org";

      # study
      chatGpt = "chatgpt.com";
      deekpeek = "chat.deepseek.com";
      gemini = "gemini.google.com";
      grok = "grok.com"; # hitler???
      claude = "claude.ai";

      # misc
      base16Preview = "sesh.github.io/base16-viewer";
      translate = "simplytranslate.ducks.party";
      vaultwarden = "vault.vaultwarden.net"; # need own server
      intellectual = "intellectual.ducks.party";
    })
  ];

  whitelist."whitelist" = {
    includes =
      # WARN:
      # it so fucking pathetic
      let
        pre = "*://";
        qute = "qute://";
        http = "http://";
        https = "https://";
        end = "/*";
      in
      (
        let
          mk = url: http + url + end;
          qk = url: qute + url + end;
        in
        [
          (qk "start")
          (mk "localhost:*")
          (mk "192.168.1.1")
          (mk "localhost:8080")
          (mk "localhost:8090")
          (mk "localhost:8384")
        ]
      )
      ++ (
        let
          mk = url: https + url + end;
          pk = url: pre + url + end;
        in
        [
          (mk "priv.au")
          (mk "rutracker.org")
          (mk "nadeko.net")
          (mk "*.nadeko.net")
          (pk "*.youtube.com")
          (mk "www.youtube.com")
          (mk "*.google.com")
          (mk "mail.google.com")
          (mk "vk.mail.ru")
          (mk "mail.proton.me")
          (mk "account.proton.me")
          (mk "*.proton.me")
          (mk "www.reddit.com")
          (mk "mastodon.ml")
          (mk "github.com")
          (mk "archlinux.org")
          (mk "*.extranix.com")
          (mk "home-manager-options.extranix.com")
          (mk "git.sr.ht")
          (mk "*.sr.ht")
          (mk "wiki.nixos.org")
          (mk "*.nixos.org")
          (mk "rutracker.org")
        ]
      );

    text =
      # js
      ''
        const meta = document.createElement('meta');
        meta.name = "color-scheme";
        meta.content = "dark light";
        document.head.appendChild(meta);
      '';
  };

  userstyle = with config.lib.stylix.colors.withHashtag; {
    "start" = {
      includes = [
        "qute://*"
      ];
      text =
        # css
        ''
          /* everywhere */
          body {
            background-color:  ${base00};
            font-family:      "${config.stylix.fonts.sansSerif.name}" !important;
          }

          h1 {
            color: ${base05};
            font-weight: normal;
          }

          a {
            text-decoration: none;
            color: ${base0B};
          }

          /* history */
          .date {
            color:          ${base04};
            font-size:      ${toString (config.stylix.fonts.sizes.applications - 2)}pt;
            padding-bottom: 15px;
            text-align:     right;
          }

          .hostname {
            color:           ${base04};
            font-size:       0.9em;
            margin-left:     10px;
          }

          td.time {
            color:       ${base04};
            text-align:  right;
            white-space: nowrap;
          }

          /* startpage */
          input {
            color:             ${base04};
            background-color:  ${base01};
            border-radius:     8px !important;
            font-family:      "${config.stylix.fonts.sansSerif.name}" !important;
          }

          .bookmarks { display:    none;   }
          .header    { margin-top: 220px;  }
          .logo      { visibility: hidden; }
        '';
    };

    "github" = {
      includes = [
        "*github.com*"
      ];
      text =
        # css
        ''
          #profile-lists-container .Box {
            background: transparent;
            border: none;
            box-shadow: none;
          }

          #profile-lists-container .Box-row {
            border: 1px solid var(--borderColor-muted) !important;
            border-radius: 8px !important;
            margin-bottom: 8px;
            background: var(--bgColor-default);
            padding: 0 !important;
            transition: background 0.15s ease, border-color 0.15s ease;
          }

          #profile-lists-container .Box-row:hover {
            background: var(--bgColor-muted);
            border-color: var(--borderColor-default) !important;
          }

          #profile-lists-container .Box-row > .d-flex {
            display: grid !important;
            grid-template-columns: minmax(150px, 220px) 1fr auto;
            align-items: center !important;
            column-gap: 10px;
            padding: 8px 12px !important;
          }

          #profile-lists-container .wb-break-word {
            font-size: 0.85rem;
            line-height: 1.35;
            opacity: 0.85;
            word-break: break-word;
          }

          #profile-lists-container .text-small.no-wrap {
            font-size: 0.75rem;
            padding: 3px 8px;
            border-radius: 999px;
            background: var(--bgColor-muted);
            border: 1px solid var(--borderColor-muted);
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: center;
            white-space: nowrap;
          }

          #profile-lists-container .Details-content--shown,
          #profile-lists-container .Details-content--shown footer {
            border: none !important;
            background: transparent;
          }

          #profile-lists-container .js-details-target {
            width: 100%;
            border: 1px solid var(--borderColor-muted);
            border-radius: 8px;
            background: var(--bgColor-default);
            font-size: 0.85rem;
            padding: 8px 10px !important;
            margin-bottom: 0 !important;
            transition: background 0.15s ease, border-color 0.15s ease;
          }

          #profile-lists-container .js-details-target:hover {
            background: var(--bgColor-muted);
            border-color: var(--borderColor-default);
            text-decoration: none;
          }
        '';
    };
  };
}
