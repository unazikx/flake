# INFO:
# minimal native wayland terminal
# very strange font and colors

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          ...
        }:
        {
          hm.programs.foot = {
            enable = true;
            server.enable = true;

            settings = import ./settings.nix;
            # i separated it for wrapper package
          };
        };
    };
}
