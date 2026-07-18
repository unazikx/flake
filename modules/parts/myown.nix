{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    myown = {
      type = "github";
      owner = "unazikx";
      repo = "nix-packages";
      inputs.nixpkgs-unstable.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nur.follows = "nur";
    };
    # keep-sorted end
  };
}
