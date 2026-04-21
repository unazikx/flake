# INFO:
# for clear trash use
# > trash-empty
#
# WARN:
# system rm replaced by trash-put

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
          ...
        }:
        {
          persist.user.directories = [
            ".local/share/Trash"
          ];

          hmPackages = [
            pkgs.trash-cli
          ];

          hm.home.shellAliases = {
            rm = lib.getExe' pkgs.trash-cli "trash-put";
          };
        };
    };
}
