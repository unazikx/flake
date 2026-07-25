{
  ...
}:

{
  zen.games.steam.non-steam-games = {
    description = ''
      side games from nixpkgs and not only
      packaged to steam, cause xdg desktop is shi
    '';

    homeManager =
      {
        lib,
        config,
        ...
      }:
      let
        steamapps = "${config.xdg.dataHome}/Steam/steamapps";
        cfg = config.programs.steam.config;
      in
      {
        programs.steam.config = {
          nonSteamApps = (
            lib.mkMerge [
              (lib.mkGames
                {
                  enable = lib.mkDefault false; # by default disabled
                  launchOptions = {
                    env = {
                      STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0";
                    };
                  };
                }
                {
                  # keep-sorted start block=yes newline_separated=yes
                  # ...
                  # keep-sorted end
                }
              )

              (lib.mkGames
                {
                  enable = lib.mkDefault false; # by default disabled
                  compatTool = cfg.defaultCompatTool;
                  launchOptions = {
                    env = {
                      STEAM_COMPAT_DATA_PATH = "${steamapps}/compatdata/0";
                    };
                  };
                }
                {
                  # keep-sorted start block=yes newline_separated=yes
                  # ...
                  # keep-sorted end
                }
              )
            ]
          );
        };
      };
  };
}
