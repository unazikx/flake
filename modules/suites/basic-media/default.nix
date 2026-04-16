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
              easyeffects
              mpd
              mpv
              swayimg
              # keep-sorted end
              ;
          };
        };
    };
}
