{
  ...
}:

{
  flake-file.inputs = {
    nixpkgs.follows = "nixpkgs-unstable";
    nixpkgs-prev.follows = "nixpkgs-unstable-prev";
    nixpkgs-stable.follows = "nixpkgs-2605";
    nixpkgs-stable-prev.follows = "nixpkgs-2505";

    darwin.follows = "nix-darwin";

    nixpkgs-lib.follows = "nixpkgs";

    # keep-sorted start block=yes newline_separated=yes
    flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      type = "github";
      owner = "nix-darwin";
      repo = "nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-2505 = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-25.05";
    };

    nixpkgs-2605 = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-26.05";
    };

    nixpkgs-unstable = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };

    nixpkgs-unstable-prev = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      rev = "567a49d1913ce81ac6e9582e3553dd90a955875f";
    };
    # keep-sorted end
  };
}
