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
