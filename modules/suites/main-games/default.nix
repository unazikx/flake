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
              epic-games
              gale
              hytale
              lsfg-vk
              mumble
              prism-launcher
              steam
              umu-launcher
              # keep-sorted end
              ;
          };
        };
    };
}
