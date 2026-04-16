{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          ...
        }:
        {
          hmPackages = lib.attrValues {
            inherit (pkgs)
              # keep-sorted start
              imagemagick
              jpegoptim
              lutgen
              optipng
              pinta
              # keep-sorted end
              ;
          };
        };
    };
}
