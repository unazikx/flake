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
          env.STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0";
          wrappers = [ (lib.getExe pkgs.gamemode) ];
        };
      }
      {
        # keep-sorted start block=yes newline_separated=yes
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
    (lib.mkSteam.mkAttrset
      {
        compatTool = defaultCompatTool;
        launchOptions = {
          env.STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0";
          wrappers = [ (lib.getExe pkgs.gamemode) ];
        };
      }
      {
        # keep-sorted start block=yes newline_separated=yes
        adventures-of-sir-kicksalot = {
          id = 2629230;
        };

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

        jalopy = {
          id = 446020;
        };

        lucid-blocks = {
          id = 3495730;
        };

        noexistence-you-me = {
          id = 2873080;
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

        space-haven = {
          id = 979110;
        };

        summer-in-mara = {
          id = 962580;
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
          freeciv = {
            name = "FreeCiv";
            target = lib.getExe pkgs.freeciv_gtk;
            compatTool = null;

            icon = pkgs.fetchurl {
              url = "https://cdn2.steamgriddb.com/icon_thumb/e2b59155b6c9e8753f967f42ea5a4d3e.png";
              sha256 = "sha256-pnoFLp1zLsNFFnZ4IRINa5OJwDfhHFW+r+V2zT0KuCY=";
            };

            artwork = {
              logo = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/logo_thumb/009da52122d75bc3150aa17e5e515204.png";
                sha256 = "sha256-qsfTzwAwGmT5iDATcLap0xp/U43ia0Dc9AqmFcKecqw=";
              };
              hero = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/hero_thumb/8d96feccca232653276d41d444536e10.jpg";
                sha256 = "sha256-6G8igBjDg08KGcJ9vxWIlGa7kcpAyBKeorojpFUWsaw=";
              };
              banner = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/thumb/53cc2097ca1a2e6c4a3b2bb499597bf0.jpg";
                sha256 = "sha256-pQxkWem5gPDT6hXv3CDBoP5nlExQFS0h/1oPAc7ebaE=";
              };
              cover = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/thumb/0a4c93ddb993d7d200fa72c65c8e7239.jpg";
                sha256 = "sha256-d8pHaeFqqISQFuO2d+GWDTqK0glHUzSYe4nfSBneAas=";
              };
            };
          };

          lincity-ng = {
            name = "LinCity";
            target = lib.getExe pkgs.lincity-ng;
            compatTool = null;

            icon = pkgs.fetchurl {
              url = "https://www.altlinux.org/Images.www.altlinux.org/2/2d/User-menu-LincityNG.png";
              sha256 = "sha256-2eg2nexAROOQ9u2j/6ouXmjENpcsN0lI0jWMLzWuhuM=";
            };
          };

          mindustry = {
            name = "Mindustry";
            target = lib.getExe' pkgs.mindustry "mindustry";
            compatTool = null;

            icon = pkgs.fetchurl {
              url = "https://cdn2.steamgriddb.com/icon_thumb/c05225ad3adfb3f4b73a7d7d04d3c2d7.png";
              sha256 = "sha256-+EbFzxORC8NrKH7Y/5lIzkd1KbMwODHhNPn20NEnsUk=";
            };

            artwork = {
              logo = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/logo_thumb/fa351d6bfd570ade7471195e5afd43f1.png";
                sha256 = "sha256-daR199b4P5HBW1WuQJAggcx6j8bi0IDJYrBmrJ7q37c=";
              };
              hero = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/hero_thumb/f4e3432b305e7e30ce4e6f981f260cce.jpg";
                sha256 = "sha256-SvcqUHT5rsAQBV3xWFc0/HrQLxoDfB/dytQoBTlWQJk=";
              };
              banner = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/thumb/e0f4585108cbed46d16e3cf0e9d86ba1.jpg";
                sha256 = "sha256-SqiHD3Wx5wjR7qObvRlqSkSD/nbYs4YQn79o5LMef7M=";
              };
              cover = pkgs.fetchurl {
                url = "https://cdn2.steamgriddb.com/thumb/518b0bc6ec175055a4bca965df70d379.jpg";
                sha256 = "sha256-Sd3YBJ3m+UMTHBFW5GOHHVAAKFnqCCWFsY4nwPkq/no=";
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
