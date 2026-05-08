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
    (lib.steam.mkAttrset
      {
        launchOptions = {
          env.STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0/pfx";
          wrappers = [ (lib.getExe pkgs.gamemode) ];
        };
      }
      {
        # keep-sorted start block=yes

        city-car-driving = {
          compatTool = "proton_8";
          id = 493490;
        };
        duck-game = {
          # https://www.protondb.com/app/312530#VBbR6m5Ilw
          compatTool = "proton_8";
          id = 312530;
        };
      }
      # keep-sorted end
    )

    # default proton tool
    (lib.steam.mkAttrset
      {
        compatTool = defaultCompatTool;
        launchOptions = {
          env.STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0/pfx";
          wrappers = [ (lib.getExe pkgs.gamemode) ];
        };
      }
      {
        # keep-sorted start block=yes

        citizen-sleeper = {
          id = 1578650;
        };
        citizen-sleeper-2 = {
          id = 2442460;
        };
        counter-strike-cz = {
          id = 80;
        };
        darksiders-genesis = {
          id = 710920;
        };
        lucid-blocks = {
          id = 3495730;
        };
        noita = {
          id = 881100;
        };
        one-million-fatal-guns = {
          id = 155710;
        };
        plastic-warfare = {
          id = 490640;
        };
        project-zomboid = {
          id = 108600;
        };
        repo = {
          id = 3214660;
        };
        sandbox = {
          id = 590830;
        };
        terraria = {
          id = 105600;
        };
        valheim = {
          id = 892970;
        };
        worms-wmd = {
          id = 327030;
        };
        # keep-sorted end
      }
    )
  ];

  nonSteamApps = (
    lib.mkMerge [
      (lib.steam.mkAttrset
        {
          enable = lib.mkDefault false; # by default disabled
          compatTool = lib.mkDefault defaultCompatTool;
          launchOptions = {
            env.STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0/pfx";
          };
        }
        {
          # keep-sorted start block=yes
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
          # keep-sorted end
        }
      )
    ]
  );
}
