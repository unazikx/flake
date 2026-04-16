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
