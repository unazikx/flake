# INFO:
# infinite canvas wayland
# like newm but other...idk

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          ...
        }:
        {
          hmPackages = [
            pkgs.driftwm
          ];
        };
    };
}
