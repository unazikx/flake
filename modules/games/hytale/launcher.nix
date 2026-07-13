{
  ...
}:

{
  zen.games.hytale.launcher = {
    description = ''
      official launcher for hytale
      built from zip archive instead flatpak

      source:
      https://github.com/unazikx/hytale-launcher-nix
    '';

    homeManagerNixos =
      {
        inputs',
        ...
      }:
      {
        home.packages = [
          inputs'.hytale-launcher.packages.hytale-launcher
        ];
      };
  };
}
