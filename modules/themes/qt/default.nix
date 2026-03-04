# INFO:
# stylix have an weird qt
# so i made own

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          config,
          ...
        }:
        {
          hm = {
            qt = {
              enable = true;
              platformTheme.name = "qtct";
            };

            xdg.configFile = (
              import ./qtct.nix {
                inherit
                  pkgs
                  config
                  ;
              }
            );
          };
        };
    };
}
