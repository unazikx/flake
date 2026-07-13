{
  ...
}:

{
  zen.games.lutris = {
    description = ''
      collection of launchers
      and oldest launcher for wine
    '';

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.lutris = {
          enable = true;

          defaultWinePackage = pkgs.proton-ge-bin-patched;

          protonPackages = [
            pkgs.proton-ge-bin-patched
          ];
        };
      };
  };
}
