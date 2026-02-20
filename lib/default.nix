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
      inputs.pkgs-by-name.flakeModule
    ];

    flake =
      {
        config,
        ...
      }:
      {
        # INFO: args what would be in
        # flake = { extendedLib, ...}: { ... };
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
        pkgs,
        system,
        ...
      }:
      {
        # INFO: args what would be in
        # perSystem = { pkgs, extendedLib, ...}: { ... };
        _module.args = {
          inherit extendedLib inputs;

          pkgs = buildPkgs {
            inherit
              system
              ;
          };
        };

        formatter = pkgs.nixfmt;
        pkgsDirectory = ../packages;
        pkgsNameSeparator = ".";
      };

    debug = true;
  }
