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
              prism-launcher
              r2modman
              steam
              hytale
              umu-launcher
              ;
          };
        };
    };
}
