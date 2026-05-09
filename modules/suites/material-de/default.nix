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
              clipboard
              dank-material-shell
              foot
              niri
              xdg
              # keep-sorted end
              ;
          };
        };
    };
}
