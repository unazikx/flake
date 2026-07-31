{
  ...
}:

{
  zen.games.umu-launcher = {
    description = ''
      universal windows apps launcher
      based on steam container
    '';

    homeManager =
      {
        pkgs,
        config,
        ...
      }:
      let
        steamapps = "${config.xdg.dataHome}/Steam/steamapps";
        steam = config.programs.steam.config.defaultCompatTool;
      in
      {
        home.packages = [
          (pkgs.umu-launcher.override {
            extraEnv = {
              PROTONPATH = steam.steamcompattool;
              WINEPREFIX = "${steamapps}/compatdata/0";
            };
          })
        ];
      };
  };
}
