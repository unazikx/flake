# INFO:
# another tool for use windows via podman

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
            ".winboat"
            ".config/winboat"
            ".local/share/winboat"
          ];

          environment.systemPackages = lib.attrValues {
            inherit (pkgs)
              winboat
              ;
          };
        };
    };
}
