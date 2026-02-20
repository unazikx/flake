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
          persist.user.directories = [ ".local/share/Trash" ];

          hmPackages = [ pkgs.trash-cli ];

          hm.home.shellAliases = {
            rm = lib.getExe' pkgs.trash-cli "trash-put";
          };
        };
    };
}
