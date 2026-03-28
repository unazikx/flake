{
  pkgs,
  lib,
  ...
}:

rec {
  enable = true;
  closeSteam = true;

  defaultCompatTool = "GE-Proton";

  apps =
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
    lib.mkMerge [
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
        }
      )
    ];
}
