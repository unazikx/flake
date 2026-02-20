inputs@{ self, ... }:

let
  extendedLib = import ./generator.nix {
    inherit
      self
      inputs
      ;
  };

  inherit (extendedLib)
    nxosLib
    buildPkgs
    ;
in

inputs.flake-parts.lib.mkFlake
  {
    inherit
      inputs
      ;
  }
  {
    systems = [ "x86_64-linux" ];

    imports = [
      # INFO:
      # will import only default.nix configurations
      # semi-dendritic
      (inputs.import-tree.filter (nxosLib.hasSuffix "default.nix") [
        ../modules
        ../machines
      ])

      (inputs.import-tree [ ../shells ])
      inputs.devshell.flakeModule
      inputs.disko.flakeModule
      inputs.home-manager.flakeModules.default
    ];

    flake =
      {
        config,
        ...
      }:
      {
        _module.args = {
          inherit extendedLib inputs;
          partsConfig = config;
        };

        # INFO:
        # nixosConfigurations,
        # diskoConfigurations are in ../machines
        #
        # homeConfigurations,
        # darwinConfigurations would be soon
      };

    perSystem =
      {
        ...
      }:
      {
        _module.args = { inherit extendedLib inputs; };
      };

    debug = true;
  }
