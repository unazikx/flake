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

  zen.games.aurelia = {
    description = ''
      tui for steam games
    '';

    includes = [
      zen.games.steam
    ];

    homeManager =
      {
        self',
        ...
      }:
      {
        home.packages = [
          self'.packages.aurelia
        ];
      };

    packages =
      {
        inputs',
        ...
      }:
      {
        aurelia = inputs'.aurelia.packages.aurelia;
      };
  };

  zen.flake-parts.default = {
    includes = [
      zen.games.aurelia
    ];
  };
}
