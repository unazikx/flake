{
  flake =
    {
      _config,
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
            inherit (_config.nixosModules)
              # keep-sorted start
              epic-games
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
