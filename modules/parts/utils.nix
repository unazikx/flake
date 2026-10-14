{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";
    };

    nix-math = {
      type = "github";
      owner = "xddxdd";
      repo = "nix-math";
    };

    nixos-hardware = {
      type = "github";
      owner = "NixOS";
      repo = "nixos-hardware";
    };
    # keep-sorted end
  };
}
