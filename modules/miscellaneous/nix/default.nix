{
  zen,
  ...
}:

{
  zen.miscellaneous.nix = {
    description = ''
      sets lix as nix package
      added registry bases on inputs
    '';

    includes = [
      # zen.miscellaneous.nix.lix
      zen.miscellaneous.nix.overlays
      zen.miscellaneous.nix.settings
    ];

    os =
      {
        self',
        inputs,
        pkgs,
        lib,
        ...
      }:
      {
        environment.systemPackages = [
          self'.packages.hasher
          pkgs.cachix
          pkgs.hydra-check
          pkgs.nix-tree
          pkgs.nurl
        ];

        nix = {
          enable = true;

          registry =
            let
              isFlake = lib.filterAttrs (_: entry: lib.isType "flake" entry);
            in
            (lib.mapAttrs (
              _: flake: {
                inherit flake;
              }
            ))
              (isFlake inputs);
        };

        nixpkgs.config.allowUnfree = true;
      };

    finix =
      {
        inputs,
        lib,
        config,
        ...
      }:
      {
        options.nixpkgs = {
          hostPlatform = lib.mkOption { type = lib.types.str; };
          config = lib.mkOption {
            type = lib.types.attrs;
            default = { };
          };
        };
        config.nixpkgs.pkgs = import inputs.nixpkgs {
          system = config.nixpkgs.hostPlatform;
          inherit (config.nixpkgs)
            config
            ;
        };
      };

    homeManager =
      {
        ...
      }:
      {
        nixpkgs.config.allowUnfree = true;
      };
  };
}
