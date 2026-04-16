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
