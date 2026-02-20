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
          persist.user.directories = [ ".local/share/hytale-launcher" ];

          hmPackages = [ pkgs.hytale ];
        };
    };
}
