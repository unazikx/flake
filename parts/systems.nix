{
  ...
}:

{
  flake-file = {
    inputs = {
      nixpkgs.follows = "nixpkgs-unstable";
      nixpkgs-lib.follows = "nixpkgs";
      darwin.follows = "nix-darwin";

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

      nixpkgs-stable = {
        type = "github";
        owner = "nixos";
        repo = "nixpkgs";
        ref = "nixos-26.05";
      };

      nixpkgs-stable-prev = {
        type = "github";
        owner = "nixos";
        repo = "nixpkgs";
        ref = "nixos-25.05";
      };

      nix-darwin = {
        type = "github";
        owner = "nix-darwin";
        repo = "nix-darwin";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      home-manager = {
        type = "github";
        owner = "nix-community";
        repo = "home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      flake-utils = {
        type = "github";
        owner = "numtide";
        repo = "flake-utils";
      };
    };
  };
}
