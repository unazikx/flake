# INFO:
# best de for default users
# i cant use it

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
          hmPackages = [ pkgs.rc2nix ];

          services.desktopManager = {
            plasma6 = {
              enable = true;
            };
          };

          hm.stylix = {
            targets.kde = {
              enable = true;
            };
          };
        };
    };
}
