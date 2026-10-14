let
  self = ./.;

  sources = import "${self}/.tack";
  with-inputs = import sources.with-inputs;
in

(with-inputs.from.tack self) (_: { }) (
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
