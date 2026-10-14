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
      ref = "main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.spectrum.follows = "spectrum";
    };

    spectrum = {
      type = "github";
      owner = "unazikx";
      repo = "spectrum";
      ref = "main";
      flake = false;
    };
    # keep-sorted end
  };
}
