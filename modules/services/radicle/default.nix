# INFO:
# p2p network
# idk

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
          persist.user.directories = [ ];

          hmPackages = [
            pkgs.radicle-tui
            pkgs.rad-key
          ];

          hm = {
            programs.radicle = {
              enable = true;

              uri = {
                web-rad = {
                  enable = true;
                  browser = "org.qutebrowser.qutebrowser.desktop";
                };
              };
            };

            services.radicle.node = {
              enable = true;
              lazy.enable = true;
            };
          };
        };
    };
}
