# TODO: here is nothing,
# i havent idea what to do
#
# INFO: generates
# { specialisation.gaming = ...; };
# by sub directories
#
#  .
# ├─  default.nix (current file)
# │
# ├─  gaming
# │  └─  default.nix
# │
# └─  steamDeck
#    └─  default.nix

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          ...
        }:
        let
          specializationsList = (
            lib.attrNames (lib.filterAttrs (_path: type: type == "directory") (lib.readDir ./.))
          );
        in
        {
          specialisation = lib.listToAttrs (
            map (name: {
              inherit
                name
                ;
              value =
                (name: {
                  inheritParentConfig = true;
                  configuration = {
                    system.nixos.tags = [ name ];
                    imports = [ ./${name}/default.nix ];
                  };
                })
                  name;
            }) specializationsList
          );
        };
    };
}
