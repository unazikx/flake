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
              caddy
              glance
              # keep-sorted end
              ;
          };
        };
    };
}
