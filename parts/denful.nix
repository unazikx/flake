{
  inputs,
  den,
  ...
}:

{
  # systems = den.systems;

  flake-file.inputs = {
    den = {
      type = "github";
      owner = "denful";
      repo = "den";
    };

    flake-file = {
      type = "github";
      owner = "denful";
      repo = "flake-file";
    };

    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    import-tree = {
      type = "github";
      owner = "denful";
      repo = "import-tree";
    };
  };

  flake-file = {
    do-not-edit = "";

    outputs =
      # nix
      ''
        inputs:
        inputs.flake-parts.lib.mkFlake { inherit inputs; } (
          inputs.import-tree [
            ./configurations
            ./modules
            ./parts
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

  imports = [
    inputs.den.flakeModule
    inputs.flake-file.flakeModules.default
    inputs.flake-parts.flakeModules.bundlers
    inputs.flake-parts.flakeModules.modules
  ];

  perSystem =
    {
      pkgs,
      ...
    }:
    {
      packages = den.lib.nh.denPackages { } pkgs;
    };

  debug = true;
}
