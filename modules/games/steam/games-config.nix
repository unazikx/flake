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
  closeSteam = true;

  defaultCompatTool = "GE-Proton";

  apps = lib.mkMerge [
    (lib.mkSteam.mkAttrset
      {
        launchOptions = {
          env = {
            STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0";
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
        compatTool = defaultCompatTool;
        launchOptions = {
          env = {
            STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0";
            PROTON_USE_NTSYNC = 1;
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
        batman-arkham-asylum.id = 35140;
        batman-arkham-city.id = 200260;
        batman-arkham-knight.id = 208650;
        battletoads.id = 1244950;
        citizen-sleeper-2.id = 2442460;
        citizen-sleeper.id = 1578650;
        counter-strike-cz-deleted-scenes.id = 100;
        counter-strike-cz.id = 80;
        cuphead.id = 268910;
        darksiders-genesis.id = 710920;
        dex-goty.id = 6910;
        dex-human-revolution.id = 238010;
        dex-invisible-war.id = 6920;
        dex-mankid-divided.id = 337000;
        dex-the-fall.id = 258180;
        disco-elysium.id = 325210;
        divine-divinity.id = 214170;
        divinity-ii.id = 219780;
        divinity-original-sin.id = 373420;
        dont-starve-together.id = 322330;
        dusk.id = 519860;
        elite-dangerous.id = 359320;
        factorio.id = 427520;
        flotsam.id = 821250;
        goat-simulator-remastered.id = 858710;
        gravity-circuit.id = 858710;
        hard-truck-2.id = 4487840;
        ion-fury.id = 562860;
        iq-under-construction.id = 3771740;
        jalopy.id = 446020;
        killer-frequency.id = 1903620;
        lego-batman-beyond-gotham.id = 313690;
        lego-bricktales.id = 1898290;
        lego-builders-journey.id = 1544360;
        lego-dc-super-villains.id = 829110;
        lego-worlds.id = 332310;
        lucid-blocks.id = 3495730;
        midbourne.id = 2355150;
        midnight-snack.id = 3363200;
        mindustry.id = 1127400;
        minecraft-dungeons.id = 1672970;
        minecraft-legends.id = 1928870;
        need-for-speed-heat.id = 1222680;
        need-for-speed.id = 1262540;
        noexistence-you-me.id = 2873080;
        noita.id = 881100;
        one-million-fatal-guns.id = 155710;
        ori-and-the-blind-forest-definitive-edition.id = 387290;
        ori-and-the-blind-forest.id = 261570;
        ori-and-the-will-of-the-wisps.id = 1057090;
        paralives.id = 1118520;
        plastic-warfare.id = 490640;
        project-zomboid.id = 108600;
        repo.id = 3214660;
        sandbox.id = 590830;
        satisfactory.id = 526870;
        serious-sam-tormental.id = 640340;
        sleeping-dogs.id = 307690;
        snacktorio.id = 1902940;
        space-haven.id = 979110;
        streets-of-rouge.id = 512900;
        summer-in-mara.id = 962580;
        sunset-overdrive.id = 847370;
        supraball.id = 321400;
        supraland-six-inches.id = 1522870;
        supraland.id = 813630;
        survivalists.id = 897450;
        terraria.id = 105600;
        tes-iii.id = 22320;
        tes-iv.id = 22330;
        tes-v.id = 489830;
        the-binding-of-isaac-rebirth.id = 250900;
        the-escapists-2.id = 641990;
        the-escapists.id = 298630;
        the-witcher-3.id = 292030;
        theotown.id = 1084020;
        valheim.id = 892970;
        warhammer-boltgun.id = 2005010;
        worms-wmd.id = 327030;
        your-only-move-is-hustle.id = 2212330;
        # keep-sorted end
      }
    )
  ];

  nonSteamApps = (
    lib.mkMerge [
      (lib.mkSteam.mkAttrset
        {
          enable = lib.mkDefault false; # by default disabled
          compatTool = lib.mkDefault defaultCompatTool;
          launchOptions = {
            env.STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0";
          };
        }
        {
          # keep-sorted start block=yes newline_separated=yes
          super-tux-kart = {
            name = "Super Tux Kart";
            target = lib.getExe pkgs.supertuxkart;
            compatTool = null;

            icon = pkgs.fetchurl {
              url = "https://cdn2.steamgriddb.com/icon_thumb/7a576629fef88f3e636afd33b09e8289.png";
              sha256 = "sha256-njzkz9L0cvWH/RhrWf3mzMbJ7nnRvQgpbmqJyq8p8uQ=";
            };

            artwork = {
              logo = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/logo_thumb/1cfdf3e390adc43a235bedda982b66b5.png";
                sha256 = "sha256-UKj0dgTNqFP1uI9CqCVbtgrY67aMj4I837xDv4xYiWY=";
              };
              hero = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/hero_thumb/76fdca9cd791acce9582bb354b48e608.jpg";
                sha256 = "sha256-quUzsDzt9RgsDtcxyfbSGQj95KcDTD5iWSkWsPpZYuk=";
              };
              banner = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/thumb/168f6513fd770f0a1e48666f60950251.jpg";
                sha256 = "sha256-cktay3D7jqdK7SMKT9Q8wfza9c2c6ZLZnprvMZr15XQ=";
              };
              cover = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/thumb/27d2cb1a3963d82eec5cfddc21d15fd9.jpg";
                sha256 = "sha256-EmO48QR43Bnz9/kjohR9unRoHj8DVTOs89iEUWX3wI8=";
              };
            };
          };

          voices-of-the-void = {
            name = "Voices of the Void";
            target = lib.getExe pkgs.own.games.votv;

            icon = pkgs.fetchurl {
              url = "https://cdn2.steamgriddb.com/icon/0c96dd4065a275bbd5bc71efcf28e74d/32/128x128.png";
              sha256 = "sha256-LMvmxxNIBpkmbxNKSdsIREBCYAsFzG1T4e45wJIEVkM=";
            };

            artwork = {
              logo = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/logo_thumb/d7a3803a2a6969551b7ff7b193c045e0.png";
                sha256 = "sha256-+hAWVWNBKfOhDptJ0Xd9ufoxYKEXp/Mff5vkMKsLGkM=";
              };
              hero = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/hero_thumb/2daf64162521b454bbf048f88fecc0a5.jpg";
                sha256 = "sha256-Ul4PAty9Sv6U+M504gfhplE6/xgCoafC7GjRLCOflUc=";
              };
              banner = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/thumb/169a4cfd73bb798780720bed9cf85b70.jpg";
                sha256 = "sha256-b27VVYUIq2YgyX3I3xH2YVuN3d78mJ70jYqldcTQt4c=";
              };
              cover = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/thumb/2be93c78abc53d25f7fac7847214f0dd.jpg";
                sha256 = "sha256-hk1BTkAqW4B2RYd9YjIvxdtlB9PrlcqDVT2RFit1vKU=";
              };
            };
          };
          # keep-sorted end
        }
      )
    ]
  );
}
