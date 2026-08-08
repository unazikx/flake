{
  inputs,
  den,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    den = {
      type = "github";
      owner = "denful";
      repo = "den";
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
    # keep-sorted end
  };

  imports = [
    inputs.den.flakeModules.default
    # inputs.den.flakeOutputs.apps
    # inputs.den.flakeOutputs.checks
    # inputs.den.flakeOutputs.devShells
    # inputs.den.flakeOutputs.flake
    # inputs.den.flakeOutputs.packages
    inputs.flake-file.flakeModules.default
    inputs.flake-parts.flakeModules.bundlers
    inputs.flake-parts.flakeModules.modules
  ];

  den.default = {
    includes = [
      # http://den.denful.dev/reference/batteries
      # keep-sorted start
      den.batteries.define-user
      den.batteries.host-aspects
      den.batteries.hostname
      den.batteries.inputs'
      den.batteries.primary-user
      den.batteries.self'
      # keep-sorted end
    ];
  };

  zen.flake-parts.default = {
    packages =
      {
        pkgs,
        ...
      }:
      den.lib.nh.denPackages {
        defaultAction = "switch";
      } pkgs;
  };

  debug = true;
}
