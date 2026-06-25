# INFO:
# containers

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          partsConfig,
          lib,
          ...
        }:
        {
          imports = lib.attrValues {
            inherit (partsConfig.nixosModules)
              # keep-sorted start
              podman
              # keep-sorted end
              ;
          };

          hm.programs.distrobox = {
            enable = true;

            containers = {
              # fuck idk
            };
          };
        };
    };
}
