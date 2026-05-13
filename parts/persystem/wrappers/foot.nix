{
  self,
  ...
}:

{
  perSystem =
    {
      pkgs,
      lib,
      ...
    }:
    {
      legacyPackages.${baseNameOf ./.} = {
        foot =
          let
            settings = lib.concatStringsSep "/" [
              (toString self)
              "modules"
              "programs"
              "terminal-utils"
              "foot"
              "settings.nix"
            ];
          in
          (pkgs.wrappers.foot.apply {
            inherit pkgs;

            settings = import settings;
          }).wrapper;
      };
    };
}
