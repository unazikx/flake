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
          persist.user.directories = [
            ".config/r2modman"
            ".config/r2modmanPlus-local"
          ];

          hmPackages = [ pkgs.r2modman ];
        };
    };
}
