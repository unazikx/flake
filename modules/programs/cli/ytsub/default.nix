# INFO:
# terminal client for reddit
# requieres token to auth

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
          hmPackages = [ pkgs.ytsub ];
        };
    };
}
