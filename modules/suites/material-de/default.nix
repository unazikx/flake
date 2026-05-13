{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          partsConfig,
          ...
        }:
        {
          imports = lib.attrValues {
            inherit (partsConfig.nixosModules)
              # keep-sorted start
              clipboard
              dank-material-shell
              foot
              niri
              xdg
              # keep-sorted end
              ;
          };
        };
    };
}
