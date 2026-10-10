{
  ...
}:

{
  zen.games.wine = {
    description = ''
      wine and winetricks
    '';

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = [
          pkgs.winetricks
          pkgs.wineWow64Packages.fonts
          pkgs.wineWow64Packages.staging
        ];
      };
  };
}
