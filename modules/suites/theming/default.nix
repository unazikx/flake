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
              gtk
              qt
              stylix
              # keep-sorted end
              ;
          };
        };
    };
}
