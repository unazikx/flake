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
              mumble
              prismLauncher
              r2modman
              steam
              # hytale
              umuLauncher
              ;
          };
        };
    };
}
