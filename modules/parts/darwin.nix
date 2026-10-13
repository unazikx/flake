{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nix-darwin = {
      type = "github";
      owner = "nix-darwin";
      repo = "nix-darwin";
      ref = "master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };
}
