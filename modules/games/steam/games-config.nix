# INFO:
# list of variables for proton
# dwproton - https://dawn.wine/dawn-winery/dwproton#runtime-config-options
# proton-ge - https://github.com/gloriouseggroll/proton-ge-custom#options

{
  pkgs,
  lib,
  config,
  ...
}:

let
  inherit (config.programs.steam.config)
    defaultCompatTool
    ;

  steamapps = "${config.hm.xdg.dataHome}/Steam/steamapps";
in

{
  enable = true;
  onSteamRunning = "close";
  # ^^^ close Steam and apply the changes, waiting for any running games to exit first

  defaultCompatTool = pkgs.proton-ge-bin;

  apps = lib.mkMerge [
    (lib.mkSteam.mkAttrset
      {
        desktopEntry.enable = true;
        launchOptions = {
          env = {
            STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0";
            PROTON_ENABLE_WAYLAND = 1;
          };
          wrappers = [ (lib.getExe pkgs.gamemode) ];
        };
      }
      {
        # keep-sorted start block=yes newline_separated=yes
        burnout-paradise-remastered = {
          compatTool = "GE-Proton";
          launchOptions = {
            env = lib.mkForce { };
            wrappers = lib.mkForce [ ];
            args = [ "-skipvideos" ];
          };
          id = 1238080;
          language = "russian";
        };

        city-car-driving = {
          compatTool = "proton_8";
          id = 493490;
        };

        duck-game = {
          # https://www.protondb.com/app/312530#VBbR6m5Ilw
          compatTool = "proton_8";
          id = 312530;
        };
        # keep-sorted end
      }
    )

    # default proton tool
    (lib.mkSteam.mkAttrset
      {
        desktopEntry.enable = true;
        compatTool = defaultCompatTool;
        launchOptions = {
          env = {
            STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0";
            PROTON_USE_NTSYNC = 1;
            PROTON_ENABLE_WAYLAND = 1;
          };
          wrappers = [ (lib.getExe pkgs.gamemode) ];
        };
      }
      {
        # keep-sorted start block=yes
        abiotic-factor.id = 427410;
        adventures-of-sir-kicksalot.id = 2629230;
        apico.id = 1390190;
        arctico.id = 325210;
        baldurs-gate-3 = {
          id = 1086940;
          language = "russian";
        };
        barony = {
          id = 371970;
          betaBranch = "translation-fix";
        };
        batman-arkham-asylum.id = 35140;
        batman-arkham-city.id = 200260;
        batman-arkham-knight.id = 208650;
        battletoads = {
          id = 1244950;
          language = "russian";
        };
        beyond-divinity = {
          id = 219760;
          language = "russian";
        };
        carmageddon-max-damage = {
          id = 505170;
          language = "russian";
        };
        citizen-sleeper-2.id = 2442460;
        citizen-sleeper.id = 1578650;
        coffee-talk-2.id = 1663220;
        coffee-talk-tokyo.id = 3161220;
        coffee-talk.id = 914800;
        counter-strike-cz-deleted-scenes.id = 100;
        counter-strike-cz.id = 80;
        cuphead.id = 268910;
        darksiders = {
          id = 50620;
          language = "russian";
        };
        darksiders-genesis.id = 710920;
        darksiders-ii = {
          id = 388410;
          language = "russian";
        };
        darksiders-iii = {
          id = 606280;
          language = "russian";
        };
        darksiders-warmastered = {
          id = 462780;
          language = "russian";
        };
        dead-cells = {
          id = 588650;
          language = "russian";
        };
        dex-goty.id = 6910;
        dex-human-revolution = {
          id = 238010;
          language = "russian";
        };
        dex-invisible-war.id = 6920;
        dex-mankid-divided = {
          id = 337000;
          language = "russian";
        };
        dex-the-fall = {
          id = 258180;
          language = "russian";
        };
        disco-elysium = {
          id = 632470;
          language = "russian";
        };
        divine-divinity = {
          id = 214170;
          language = "russian";
        };
        divinity-2 = {
          id = 219780;
          language = "russian";
        };
        divinity-original-sin = {
          id = 373420;
          language = "russian";
        };
        divinity-original-sin-2 = {
          id = 435150;
          language = "russian";
        };
        dont-starve-together.id = 322330;
        dusk = {
          id = 519860;
          language = "russian";
        };
        easy-delivery-co.id = 3293010;
        elite-dangerous = {
          id = 359320;
          language = "russian";
        };
        enter-the-gungeon = {
          id = 311690;
          language = "russian";
        };
        exit-the-gungeon.id = 1209490;
        factorio = {
          id = 427520;
          language = "russian";
        };
        flotsam.id = 821250;
        fnaf-popgoes.id = 1986840;
        gloomwood.id = 1150760;
        goat-simulator-remastered.id = 1762930;
        gravity-circuit.id = 858710;
        hard-truck-2 = {
          id = 4487840;
          language = "russian";
        };
        garrys-mod = {
          id = 4487840;
          betaBranch = "x86-64";
        };
        hollow-knight-silksong.id = 1030300;
        hollow-knight.id = 367520;
        hrot.id = 824600;
        hydroneer.id = 1106840;
        intravenous-2.id = 2608270;
        intravenous.id = 1486630;
        ion-fury.id = 562860;
        iq-under-construction.id = 3771740;
        jalopy.id = 446020;
        kerbal-space-program = {
          id = 220200;
          language = "russian";
        };
        killer-frequency = {
          id = 1903620;
          language = "russian";
        };
        kynseed.id = 758870;
        lego-batman-beyond-gotham.id = 313690;
        lego-bricktales = {
          id = 1898290;
          language = "russian";
        };
        lego-builders-journey.id = 1544360;
        lego-dc-super-villains = {
          id = 829110;
          language = "russian";
        };
        lego-worlds = {
          id = 332310;
          language = "russian";
        };
        lucid-blocks.id = 3495730;
        midbourne.id = 2355150;
        midnight-snack.id = 3363200;
        mindustry.id = 1127400;
        minecraft-dungeons.id = 1672970;
        minecraft-legends.id = 1928870;
        necesse = {
          id = 1169040;
          language = "russian";
        };
        need-for-speed = {
          id = 1262540;
          language = "russian";
        };
        need-for-speed-heat = {
          id = 1222680;
          language = "russian";
        };
        noexistence-you-me.id = 2873080;
        noita.id = 881100;
        one-million-fatal-guns.id = 155710;
        ori-and-the-blind-forest = {
          id = 261570;
          language = "russian";
        };
        ori-and-the-blind-forest-definitive-edition = {
          id = 387290;
          language = "russian";
        };
        ori-and-the-will-of-the-wisps.id = 1057090;
        overcooked = {
          id = 448510;
          language = "russian";
        };
        paralives.id = 1118520;
        plastic-warfare.id = 490640;
        project-warlock-2.id = 1640300;
        project-zomboid = {
          id = 108600;
          betaBranch = "unstable";
        };
        repo.id = 3214660;
        sandbox.id = 590830;
        satisfactory.id = 526870;
        selaco.id = 1592280;
        serious-sam-tormental.id = 640340;
        shapez-2.id = 2162800;
        shapez.id = 1318690;
        sleeping-dogs = {
          id = 307690;
          language = "russian";
        };
        snacktorio.id = 1902940;
        space-haven.id = 979110;
        starbound.id = 211820;
        stick-it-to-the-stickman = {
          id = 2085540;
          language = "russian";
        };
        streets-of-rouge = {
          id = 512900;
          language = "russian";
        };
        summer-in-mara.id = 962580;
        sunset-overdrive = {
          id = 847370;
          language = "russian";
        };
        supraball.id = 321400;
        supraland-six-inches.id = 1522870;
        supraland.id = 813630;
        terraria.id = 105600;
        tes-iii.id = 22320;
        tes-iv.id = 22330;
        tes-v = {
          id = 489830;
          language = "russian";
        };
        the-binding-of-isaac-rebirth.id = 250900;
        the-escapists = {
          id = 298630;
          language = "russian";
        };
        the-escapists-2 = {
          id = 641990;
          language = "russian";
        };
        the-long-dark.id = 305620;
        the-survivalists = {
          id = 897450;
          language = "russian";
        };
        the-witcher-3 = {
          id = 292030;
          language = "russian";
        };
        theotown.id = 1084020;
        travelers-rest.id = 1139980;
        valheim.id = 892970;
        warhammer-boltgun.id = 2005010;
        watch-dogs = {
          id = 243470;
          language = "russian";
        };
        webbed = {
          id = 1390350;
          language = "russian";
        };
        worms-wmd = {
          id = 327030;
          language = "russian";
        };
        your-only-move-is-hustle.id = 2212330;
        # keep-sorted end
      }
    )
  ];

  # nonSteamApps = (
  #   lib.mkMerge [
  #     (lib.mkSteam.mkAttrset
  #       {
  #         enable = lib.mkDefault false; # by default disabled
  #         compatTool = lib.mkDefault defaultCompatTool;
  #         launchOptions = {
  #           env.STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0";
  #         };
  #       }
  #       {
  #         # keep-sorted start block=yes newline_separated=yes
  #           artwork = {
  #             logo = pkgs.fetchurl {
  #               url = "https://cdn2.steamgriddb.com/logo_thumb/1cfdf3e390adc43a235bedda982b66b5.png";
  #               sha256 = "sha256-UKj0dgTNqFP1uI9CqCVbtgrY67aMj4I837xDv4xYiWY=";
  #             };
  #             hero = pkgs.fetchurl {
  #               url = "https://cdn2.steamgriddb.com/hero_thumb/76fdca9cd791acce9582bb354b48e608.jpg";
  #               sha256 = "sha256-quUzsDzt9RgsDtcxyfbSGQj95KcDTD5iWSkWsPpZYuk=";
  #             };
  #             banner = pkgs.fetchurl {
  #               url = "https://cdn2.steamgriddb.com/thumb/168f6513fd770f0a1e48666f60950251.jpg";
  #               sha256 = "sha256-cktay3D7jqdK7SMKT9Q8wfza9c2c6ZLZnprvMZr15XQ=";
  #             };
  #             cover = pkgs.fetchurl {
  #               url = "https://cdn2.steamgriddb.com/thumb/27d2cb1a3963d82eec5cfddc21d15fd9.jpg";
  #               sha256 = "sha256-EmO48QR43Bnz9/kjohR9unRoHj8DVTOs89iEUWX3wI8=";
  #             };
  #           };
  #         };

  #           icon = pkgs.fetchurl {
  #             url = "https://cdn2.steamgriddb.com/icon/0c96dd4065a275bbd5bc71efcf28e74d/32/128x128.png";
  #             sha256 = "sha256-LMvmxxNIBpkmbxNKSdsIREBCYAsFzG1T4e45wJIEVkM=";
  #           };

  #           icon = pkgs.fetchurl {
  #             url = "https://cdn2.steamgriddb.com/icon_thumb/7a576629fef88f3e636afd33b09e8289.png";
  #             sha256 = "sha256-njzkz9L0cvWH/RhrWf3mzMbJ7nnRvQgpbmqJyq8p8uQ=";
  #           };

  #         super-tux-kart = {
  #           name = "Super Tux Kart";
  #           target = lib.getExe pkgs.supertuxkart;
  #           compatTool = null;

  #         voices-of-the-void = {
  #           name = "Voices of the Void";
  #           target = lib.getExe pkgs.own.games.votv;

  #           artwork = {
  #             logo = pkgs.fetchurl {
  #               url = "https://cdn2.steamgriddb.com/logo_thumb/d7a3803a2a6969551b7ff7b193c045e0.png";
  #               sha256 = "sha256-+hAWVWNBKfOhDptJ0Xd9ufoxYKEXp/Mff5vkMKsLGkM=";
  #             };
  #             hero = pkgs.fetchurl {
  #               url = "https://cdn2.steamgriddb.com/hero_thumb/2daf64162521b454bbf048f88fecc0a5.jpg";
  #               sha256 = "sha256-Ul4PAty9Sv6U+M504gfhplE6/xgCoafC7GjRLCOflUc=";
  #             };
  #             banner = pkgs.fetchurl {
  #               url = "https://cdn2.steamgriddb.com/thumb/169a4cfd73bb798780720bed9cf85b70.jpg";
  #               sha256 = "sha256-b27VVYUIq2YgyX3I3xH2YVuN3d78mJ70jYqldcTQt4c=";
  #             };
  #             cover = pkgs.fetchurl {
  #               url = "https://cdn2.steamgriddb.com/thumb/2be93c78abc53d25f7fac7847214f0dd.jpg";
  #               sha256 = "sha256-hk1BTkAqW4B2RYd9YjIvxdtlB9PrlcqDVT2RFit1vKU=";
  #             };
  #           };
  #         };
  #         # keep-sorted end
  #       }
  #     )
  #   ]
  # );
}
