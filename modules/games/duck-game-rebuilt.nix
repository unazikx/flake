{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    duck-game-rebuilt-nix = {
      type = "github";
      owner = "klof44";
      repo = "duckgamerebuilt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.games.duck-game-rebuilt = {
    description = ''
      decompiled Duck Game with extra features
    '';

    homeManager =
      {
        inputs',
        ...
      }:
      {
        home.packages = [
          inputs'.duck-game-rebuilt-nix.packages.default
        ];
      };
  };
}
