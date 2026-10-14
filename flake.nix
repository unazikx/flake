{
  outputs =
    _:
    let
      self = ./.;
      srcs = import "${self}/.lon/lon.nix";
      with-inputs = import srcs.with-inputs;
    in
    (with-inputs.from.lon' self ".lon")
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
      );
}
