{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    flake-file = {
      type = "github";
      owner = "denful";
      repo = "flake-file";
    };
    # keep-sorted end
  };

  flake-file = {
    do-not-edit = "";

    outputs =
      # nix
      ''
        inputs:
        inputs.flake-parts.lib.mkFlake
          {
            inherit inputs;
          }
          (
            inputs.import-tree [
              ./configurations
              ./files
              ./modules
              ./shells
            ]
          )
      '';

    prune-lock.enable = true;

    style = {
      sep.inputs = "
          \n
        ";

      sortPriority = {
        flake = [
          "description"
          "inputs"
          "outputs"
          "nixConfig"
        ];
      };
    };
  };
}
