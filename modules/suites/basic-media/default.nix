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
