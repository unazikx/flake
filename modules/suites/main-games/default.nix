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
              epic-games
              hytale
              lsfg-vk
              mumble
              prism-launcher
              r2modman
              steam
              umu-launcher
              # keep-sorted end
              ;
          };
        };
    };
}
