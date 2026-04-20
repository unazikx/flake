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
