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

    imports = with inputs; [
      # INFO:
      # will import only default.nix configurations
      # semi-dendritic
      (import-tree.filter (nxosLib.hasSuffix "default.nix") [
        # https://import-tree.oeiuwq.com/getting-started/quick-start
        # directories with name ./_something will be ignored
        ../modules
        ../machines
      ])

      (import-tree [ ../persystem ])

      # keep-sorted start
      devshell.flakeModule
      disko.flakeModule
      process-compose-flake.flakeModule
      files.flakeModules.default
      flake-parts.flakeModules.bundlers
      github-actions-nix.flakeModule
      home-manager.flakeModules.default
      make-shell.flakeModules.default
      nix-wrapper-modules.flakeModules.default
      treefmt-nix.flakeModule
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
          _config = config;
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
