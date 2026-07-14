{
  ...
}:

{
  flake-file.inputs = {
    hytale-launcher = {
      type = "github";
      owner = "unazikx";
      repo = "hytale-launcher-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

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
