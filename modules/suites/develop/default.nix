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
              git
              hut
              nix-config
              nix-tools
              ssh
              # keep-sorted end
              ;
          };
        };
    };
}
