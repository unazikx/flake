inputs@{
  self,
  ...
}:

let
  extendedLib = import ./generator.nix {
    inherit
      self
      inputs
      ;
  };

  inherit (extendedLib)
    nxosLib
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
        # https://import-tree.oeiuwq.com/getting-started/quick-start
        # directories with name ./_something will be ignored
        ../modules
        ../machines
      ])

      (inputs.import-tree [ ../persystem ])
      # keep-sorted start
      inputs.devshell.flakeModule
      inputs.disko.flakeModule
      # inputs.emanote.flakeModule
      inputs.files.flakeModules.default
      inputs.flake-parts.flakeModules.bundlers
      inputs.github-actions-nix.flakeModule
      inputs.home-manager.flakeModules.default
      inputs.make-shell.flakeModules.default
      inputs.nix-wrapper-modules.flakeModules.default
      inputs.treefmt-nix.flakeModule
      # keep-sorted end
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
