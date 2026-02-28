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
          hm.programs.spotify-player = (
            {
              enable = true;
            }
            // import ./settings.nix {
              inherit pkgs lib config;
            }
          );
        };
    };
}
