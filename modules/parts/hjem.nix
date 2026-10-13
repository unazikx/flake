{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    hjem = {
      type = "github";
      owner = "feel-co";
      repo = "hjem";
      ref = "main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem-rum = {
      type = "github";
      owner = "snugnug";
      repo = "hjem-rum";
      ref = "main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hjem.follows = "hjem";
    };
    # keep-sorted end
  };
}
