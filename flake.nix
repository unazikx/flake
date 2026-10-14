{
  outputs =
    _:
    let
      self = ./.;

      srcs = import "${self}/.lon/lon.nix";
      overrides = import "${self}/.lon/lon-follows.nix";

      with-inputs = import srcs.with-inputs;
    in
    (with-inputs.from.lon' self ".lon") overrides (
      inputs:
      (inputs.flake-parts.lib.mkFlake
        {
          inherit inputs;
        }
        (
          inputs.import-tree [
            ./configurations
            ./modules
          ]
        )
      )
    );
}
