{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    millennium = {
      type = "github";
      owner = "steamclienthomebrew";
      repo = "millennium";
      dir = "packages/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.games.millennium = {
    description = ''
      custom css injector and extensions for steam
    '';

    includes = [
      zen.games.steam
    ];

    wiki = {
      "Millennium" = {
        links = [ ];
      };
    };

    nixos =
      {
        inputs',
        ...
      }:
      {
        programs.steam = {
          package = inputs'.millennium.packages.millennium-steam;
        };
      };
  };
}
