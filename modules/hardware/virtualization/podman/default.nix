# INFO:
# enables podman
# i will use this for WinApps or Windows in container

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
          ...
        }:
        {
          virtualisation = {
            podman = {
              enable = true;
              dockerCompat = true;
              dockerSocket.enable = true;

              autoPrune = {
                enable = true;
                flags = [
                  "--all"
                  "--volumes"
                ];
              };

              defaultNetwork.settings = {
                dns_enabled = true;
              };

              extraPackages = lib.attrValues {
                inherit (pkgs)
                  podman-compose
                  podman-tui
                  ;
              };
            };

            spiceUSBRedirection.enable = true;
          };
        };
    };
}
