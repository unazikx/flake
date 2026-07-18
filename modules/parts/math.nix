{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nix-math = {
      type = "github";
      owner = "xddxdd";
      repo = "nix-math";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    # keep-sorted end
  };
}
