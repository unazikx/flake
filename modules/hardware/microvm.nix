{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    microvm-nix = {
      type = "github";
      owner = "microvm-nix";
      repo = "microvm.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };
}
