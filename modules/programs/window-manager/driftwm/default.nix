# INFO:
# executes on timer

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
          hmPackages = [ pkgs.driftwm ];
        };
    };
}
