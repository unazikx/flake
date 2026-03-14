{
  flake =
    {
      partsConfig,
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          ...
        }:
        {
          imports = lib.attrValues {
            inherit (partsConfig.nixosModules)
              clipboard
              dank-material-shell
              kitty
              niri
              xdg
              ;
          };
        };
    };
}
