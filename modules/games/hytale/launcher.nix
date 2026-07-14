{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    hytale-launcher = {
      type = "github";
      owner = "unazikx";
      repo = "hytale-launcher-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
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
