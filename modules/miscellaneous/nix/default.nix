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
      zen.miscellaneous.nix.substituters
    ];

    nixos =
      {
        inputs,
        inputs',
        pkgs,
        lib,
        ...
      }:
      {
        environment.systemPackages = [
          inputs'.myown.legacyPackages.hasher
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

    homeManager =
      {
        ...
      }:
      {
        nixpkgs.config.allowUnfree = true;
      };
  };
}
