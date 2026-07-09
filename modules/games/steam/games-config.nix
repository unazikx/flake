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
        updateBehavior = "always";
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
        "Burnout Paradise Remastered" = {
          compatTool = "GE-Proton";
          launchOptions = {
            env = lib.mkForce { };
            wrappers = lib.mkForce [ ];
            args = [ "-skipvideos" ];
          };
          id = 1238080;
          language = "russian";
        };

        "City Car Driving" = {
          compatTool = "proton_8";
          id = 493490;
        };

        "Duck Game" = {
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
        updateBehavior = "always";
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
        "Abiotic Factor" = {
          id = 427410;
        };
        "Adventures Of Sir Kicksalot" = {
          id = 2629230;
        };
        "Apico" = {
          id = 1390190;
        };
        "Arctico" = {
          id = 325210;
        };
        "Baldurs Gate 3" = {
          id = 1086940;
          language = "russian";
        };
        "Barony" = {
          id = 371970;
          betaBranch = "translation-fix";
        };
        "Batman Arkham Asylum" = {
          id = 35140;
        };
        "Batman Arkham City" = {
          id = 200260;
        };
        "Batman Arkham Knight" = {
          id = 208650;
        };
        "Battletoads" = {
          id = 1244950;
          language = "russian";
        };
        "Beyond Divinity" = {
          id = 219760;
          language = "russian";
        };
        "Carmageddon Max Damage" = {
          id = 505170;
          language = "russian";
        };
        "Citizen Sleeper 2" = {
          id = 2442460;
        };
        "Citizen Sleeper" = {
          id = 1578650;
        };
        "Coffee Talk 2" = {
          id = 1663220;
        };
        "Coffee Talk Tokyo" = {
          id = 3161220;
        };
        "Coffee Talk" = {
          id = 914800;
        };
        "Counter Strike CZ Deleted Scenes" = {
          id = 100;
        };
        "Counter Strike CZ" = {
          id = 80;
        };
        "Cuphead" = {
          id = 268910;
        };
        "Darksiders Genesis" = {
          id = 710920;
        };
        "Darksiders II" = {
          id = 388410;
          language = "russian";
        };
        "Darksiders III" = {
          id = 606280;
          language = "russian";
        };
        "Darksiders Warmastered" = {
          id = 462780;
          language = "russian";
        };
        "Darksiders" = {
          id = 50620;
          language = "russian";
        };
        "Dead Cells" = {
          id = 588650;
          language = "russian";
        };
        "Dex Goty" = {
          id = 6910;
        };
        "Dex Human Revolution" = {
          id = 238010;
          language = "russian";
        };
        "Dex Invisible War" = {
          id = 6920;
        };
        "Dex Mankid Divided" = {
          id = 337000;
          language = "russian";
        };
        "Dex The Fall" = {
          id = 258180;
          language = "russian";
        };
        "Disco Elysium" = {
          id = 632470;
          language = "russian";
        };
        "Divine Divinity" = {
          id = 214170;
          language = "russian";
        };
        "Divinity 2" = {
          id = 219780;
          language = "russian";
        };
        "Divinity Original Sin 2" = {
          id = 435150;
          language = "russian";
        };
        "Divinity Original Sin" = {
          id = 373420;
          language = "russian";
        };
        "Dont Starve Together" = {
          id = 322330;
        };
        "Dusk" = {
          id = 519860;
          language = "russian";
        };
        "Easy Delivery Co" = {
          id = 3293010;
        };
        "Elite Dangerous" = {
          id = 359320;
          language = "russian";
        };
        "Enter The Gungeon" = {
          id = 311690;
          language = "russian";
        };
        "Exit The Gungeon" = {
          id = 1209490;
        };
        "Factorio" = {
          id = 427520;
          language = "russian";
        };
        "Flotsam" = {
          id = 821250;
        };
        "Fnaf Popgoes" = {
          id = 1986840;
        };
        "Garrys Mod" = {
          id = 4487840;
          betaBranch = "x86-64";
        };
        "Gloomwood" = {
          id = 1150760;
        };
        "Goat Simulator Remastered" = {
          id = 1762930;
        };
        "Gravity Circuit" = {
          id = 858710;
        };
        "Hard Truck 2" = {
          id = 4487840;
          language = "russian";
        };
        "Hollow Knight Silksong" = {
          id = 1030300;
        };
        "Hollow Knight" = {
          id = 367520;
        };
        "Hrot" = {
          id = 824600;
        };
        "Hydroneer" = {
          id = 1106840;
        };
        "Intravenous 2" = {
          id = 2608270;
        };
        "Intravenous" = {
          id = 1486630;
        };
        "Ion Fury" = {
          id = 562860;
        };
        "Iq Under Construction" = {
          id = 3771740;
        };
        "Jalopy" = {
          id = 446020;
        };
        "Kerbal Space Program" = {
          id = 220200;
          language = "russian";
        };
        "Killer Frequency" = {
          id = 1903620;
          language = "russian";
        };
        "Kynseed" = {
          id = 758870;
        };
        "Lego Batman Beyond Gotham" = {
          id = 313690;
        };
        "Lego Bricktales" = {
          id = 1898290;
          language = "russian";
        };
        "Lego Builders Journey" = {
          id = 1544360;
        };
        "Lego Dc Super Villains" = {
          id = 829110;
          language = "russian";
        };
        "Lego Worlds" = {
          id = 332310;
          language = "russian";
        };
        "Lucid Blocks" = {
          id = 3495730;
        };
        "Midbourne" = {
          id = 2355150;
        };
        "Midnight Snack" = {
          id = 3363200;
        };
        "Mindustry" = {
          id = 1127400;
        };
        "Minecraft Dungeons" = {
          id = 1672970;
        };
        "Minecraft Legends" = {
          id = 1928870;
        };
        "Necesse" = {
          id = 1169040;
          language = "russian";
        };
        "Need For Speed Heat" = {
          id = 1222680;
          language = "russian";
        };
        "Need For Speed" = {
          id = 1262540;
          language = "russian";
        };
        "Noexistence You Me" = {
          id = 2873080;
        };
        "Noita" = {
          id = 881100;
        };
        "One Million Fatal Guns" = {
          id = 155710;
        };
        "Ori And The Blind Forest Definitive Edition" = {
          id = 387290;
          language = "russian";
        };
        "Ori And The Blind Forest" = {
          id = 261570;
          language = "russian";
        };
        "Ori And The Will Of The Wisps" = {
          id = 1057090;
        };
        "Overcooked" = {
          id = 448510;
          language = "russian";
        };
        "Paralives" = {
          id = 1118520;
        };
        "Plastic Warfare" = {
          id = 490640;
        };
        "Project Warlock 2" = {
          id = 1640300;
        };
        "Project Zomboid" = {
          id = 108600;
          betaBranch = "unstable";
        };
        "Repo" = {
          id = 3214660;
        };
        "Sandbox" = {
          id = 590830;
        };
        "Satisfactory" = {
          id = 526870;
        };
        "Selaco" = {
          id = 1592280;
        };
        "Serious Sam Tormental" = {
          id = 640340;
        };
        "Shapez 2" = {
          id = 2162800;
        };
        "Shapez" = {
          id = 1318690;
        };
        "Sleeping Dogs" = {
          id = 307690;
          language = "russian";
        };
        "Snacktorio" = {
          id = 1902940;
        };
        "Space Haven" = {
          id = 979110;
        };
        "Starbound" = {
          id = 211820;
        };
        "Stick It To The Stickman" = {
          id = 2085540;
          language = "russian";
        };
        "Streets Of Rouge" = {
          id = 512900;
          language = "russian";
        };
        "Summer In Mara" = {
          id = 962580;
        };
        "Sunset Overdrive" = {
          id = 847370;
          language = "russian";
        };
        "Supraball" = {
          id = 321400;
        };
        "Supraland Six Inches" = {
          id = 1522870;
        };
        "Supraland" = {
          id = 813630;
        };
        "Terraria" = {
          id = 105600;
        };
        "Tes Iii" = {
          id = 22320;
        };
        "Tes Iv" = {
          id = 22330;
        };
        "Tes V" = {
          id = 489830;
          language = "russian";
        };
        "The Binding Of Isaac Rebirth" = {
          id = 250900;
        };
        "The Escapists 2" = {
          id = 641990;
          language = "russian";
        };
        "The Escapists" = {
          id = 298630;
          language = "russian";
        };
        "The Long Dark" = {
          id = 305620;
        };
        "The Survivalists" = {
          id = 897450;
          language = "russian";
        };
        "The Witcher 3" = {
          id = 292030;
          language = "russian";
        };
        "Theotown" = {
          id = 1084020;
        };
        "Travelers Rest" = {
          id = 1139980;
        };
        "Valheim" = {
          id = 892970;
        };
        "Warhammer Boltgun" = {
          id = 2005010;
        };
        "Watch Dogs" = {
          id = 243470;
          language = "russian";
        };
        "Webbed" = {
          id = 1390350;
          language = "russian";
        };
        "Worms Wmd" = {
          id = 327030;
          language = "russian";
        };
        "Your Only Move Is Hustle" = {
          id = 2212330;
        };
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
