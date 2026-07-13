{
  ...
}:

{
  zen.miscellaneous.nix.lix = {
    nixos =
      {
        pkgs,
        ...
      }:
      {
        nix.package = pkgs.lixPackageSets.stable.lix;

        nixpkgs.overlays = [
          (_prev: _new: {
            inherit (_new.lixPackageSets.stable)
              nixpkgs-review
              nix-eval-jobs
              nix-fast-build
              colmena
              ;
          })
        ];
      };
  };
}
