# INFO:
# best video editor with color control
#
# WARN:
# it will be very very long (6~ gb for 20.0)
# kdenlive is shit

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
            ".local/share/DaVinciResolve"
            ".local/state/DaVinciResolve"
          ];

          hm.home.packages = lib.attrValues {
            davinci-resolve-cracked = pkgs.callPackage ./package.nix { };
          };
        };
    };
}
