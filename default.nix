let
  sources = import ./npins;

  with-inputs = import sources.with-inputs (
    sources
    // {
      self.outPath = dirOf ./flake.nix;
    }
  );
in

with-inputs
  (_inputs: {
    nixpkgs.follows = "nixpkgs-unstable";
    nixpkgs-lib.follows = "nixpkgs";
  })
  (
    inputs:
    (inputs.flake-parts.lib.mkFlake
      {
        inherit inputs;
      }
      (
        inputs.import-tree [
          ./configurations
          ./files
          ./shells
          ./modules
        ]
      )
    )
  )
