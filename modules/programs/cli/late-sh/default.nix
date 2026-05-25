# INFO:
# cozy terminal clubhouse for developers
# companion CLI for local audio playback

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
          packages = [ pkgs.late ];
        };
    };
}
