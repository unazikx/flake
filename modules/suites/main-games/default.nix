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
              epic-games
              hytale
              mumble
              prism-launcher
              r2modman
              steam
              umu-launcher
              ;
          };
        };
    };
}
