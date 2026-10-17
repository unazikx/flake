{
  outputs =
    _:
    let
      self = ./.;

      sources = import "${self}/.lon/lon.nix";
      with-inputs = (import sources.with-inputs).from;

      follows = import "${self}/.lon/lon-follows.nix";

      outputs =
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
        );
    in
    (with-inputs.lon' self ".lon") follows outputs;

  nixConfig = {
    accept-flake-config = true;
    warn-dirty = false;
    auto-optimise-store = true;
    builders-use-substitutes = true;

    extra-experimental-features = [
      "flakes"
      "nix-command"
      "pipe-operators"
    ];
  };
}
