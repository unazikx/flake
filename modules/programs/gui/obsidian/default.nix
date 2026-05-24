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
            programs.obsidian = {
              enable = true;

              vaults =
                let
                  dir = ./vaults;
                  fromDir = (lib.filterAttrs (_name: type: type == "directory") (lib.readDir dir));
                in
                lib.mapAttrs (
                  name: _:
                  import (dir + "/${name}/main.nix") {
                    inherit pkgs lib config;
                  }
                ) fromDir;
            };
          };
        };
    };
}
