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
          persist.user.directories = [ ".srb2" ];

          hmPackages = [ pkgs.srb2 ];
        };
    };
}
