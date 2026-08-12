{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    aurelia = {
      type = "github";
      owner = "drackrath";
      repo = "aurelia";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    # keep-sorted end
  };

  zen.games.aurelia-tui = {
    description = ''
      tui for steam games
    '';

    includes = [
      zen.games.steam
      zen.games.umu-launcher
    ];

    homeManager =
      {
        inputs',
        ...
      }:
      {
        home.packages = [
          inputs'.aurelia.packages.aurelia
        ];
      };
  };
}
