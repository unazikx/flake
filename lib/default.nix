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

    imports =
      with inputs;
      let
        mkFilter = file: import-tree.filter (nxosLib.hasSuffix file);
      in
      [
        # INFO:
        # will import only default.nix configurations
        # semi-dendritic

        # https://import-tree.oeiuwq.com/getting-started/quick-start
        # directories with name ./_something will be ignored
        (mkFilter "default.nix" [ ../modules ])
        (mkFilter "configuration.nix" [ ../machines ])

        (import-tree [ ../persystem ])

        # keep-sorted start
        devshell.flakeModule
        disko.flakeModule
        files.flakeModules.default
        flake-parts.flakeModules.bundlers
        github-actions-nix.flakeModule
        home-manager.flakeModules.default
        make-shell.flakeModules.default
        nix-wrapper-modules.flakeModules.default
        nix-wrapper-modules.flakeModules.wrappers
        process-compose-flake.flakeModule
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
          inherit
            extendedLib
            self
            inputs
            ;

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
        system,
        ...
      }:
      {
        _module.args = {
          inherit
            extendedLib
            inputs
            ;

          pkgs = import inputs.nixpkgs {
            inherit system;

            overlays = [
              (_final: _prev: {
                inherit (inputs.nix-wrapper-modules)
                  wrappers
                  ;

                inherit (inputs.nix-wrapper-modules.lib)
                  wrapPackage
                  wrapModule
                  ;
              })
            ];
          };
        };
      };

    debug = true;
  }
