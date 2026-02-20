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
              imagemagick
              jpegoptim
              lutgen
              optipng
              pinta
              ;
          };
        };
    };
}
