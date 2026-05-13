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
              aerc
              khal
              khard
              libreoffice
              zathura
              # keep-sorted end
              ;
          };
        };
    };
}
