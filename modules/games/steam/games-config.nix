{
  pkgs,
  lib,
  config,
  ...
}:

let
  mkAttrset =
    options:
    lib.mapAttrs (
      _: attrs:
      lib.mkMerge [
        options
        attrs
      ]
    );
in

rec {
  enable = true;
  closeSteam = true;

  defaultCompatTool = "GE-Proton";

  apps = lib.mkMerge [
    (mkAttrset
      {
        launchOptions = {
          wrappers = [ (lib.getExe pkgs.gamemode) ];
        };
      }
      {
        duck-game = {
          # https://www.protondb.com/app/312530#VBbR6m5Ilw
          compatTool = "proton_8";
          id = 312530;
        };

        city-car-driving = {
          compatTool = "proton_8";
          id = 493490;
        };
      }
    )

    # default proton tool
    (mkAttrset
      {
        compatTool = defaultCompatTool;
        launchOptions = {
          wrappers = [ (lib.getExe pkgs.gamemode) ];
        };
      }
      {
        terraria = {
          id = 105600;
        };

        project-zomboid = {
          id = 108600;
        };

        valheim = {
          id = 892970;
        };

        lucid-blocks = {
          id = 3495730;
        };

        sandbox = {
          id = 590830;
        };

        counter-strike-cz = {
          id = 80;
        };

        repo = {
          id = 3214660;
        };

        worms-wmd = {
          id = 327030;
        };

        citizen-sleeper = {
          id = 1578650;
        };

        citizen-sleeper-2 = {
          id = 2442460;
        };

        darksiders-genesis = {
          id = 710920;
        };
      }
    )
  ];

  nonSteamApps = lib.mkIf (lib.configurationName == "pcRyazenka") (
    lib.mkMerge [
      (mkAttrset
        {
          compatTool = defaultCompatTool;
        }
        {
          voices-of-the-void = {
            name = "Voices of the Void";
            target = lib.getExe pkgs.own.games.votv;
            launchOptions =
              let
                r2modman-enabled = true;
              in
              lib.mkIf r2modman-enabled {
                env.WINEDLLOVERRIDES = "winhttp,version=n,b";
                wrappers = [
                  "${config.hm.xdg.configHome}/r2modmanPlus-local/VotV/linux_wrapper.sh"
                ];
              };
          };
        }
      )
    ]
  );
}
