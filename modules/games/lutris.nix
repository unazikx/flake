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
        self',
        config,
        ...
      }:
      {
        programs.lutris = {
          enable = true;

          defaultWinePackage = self'.packages.proton-ge-patched;

          protonPackages = [
            config.programs.lutris.defaultWinePackage
          ];
        };
      };
  };
}
