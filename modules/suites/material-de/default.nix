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
              clipboard
              dank-material-shell
              kitty
              niri
              xdg
              # keep-sorted end
              ;
          };
        };
    };
}
