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
            lib.attrNames (lib.filterAttrs (path: type: type == "directory") (lib.readDir ./.))
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
