# INFO:
# best notes database
#
# WARN:
# press enable plugins at start

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        {
          persist.user.directories = [
            ".config/obsidian"
          ];

          hm = {
            imports = [ ./patch.nix ];

            programs.obsidian = {
              enable = true;

              extraSettings.frame = "native";

              vaults =
                let
                  dir = ./.;
                  fromDir = (lib.filterAttrs (name: type: type == "directory") (lib.readDir dir));
                in
                lib.mapAttrs (
                  name: _:
                  import (dir + "/${name}/main.nix") {
                    inherit
                      pkgs
                      lib
                      config
                      ;
                  }
                ) fromDir;
            };
          };
        };
    };
}
