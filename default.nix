let
  self = ./.;

  sources = import "${self}/npins";
  with-inputs = import sources.with-inputs;
in

(with-inputs.from.npins self)
  (_: {
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
