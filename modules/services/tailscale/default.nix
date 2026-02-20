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
          persist.directories = [ "/var/lib/tailscale" ];

          services.tailscale = {
            enable = true;
            openFirewall = true;

            useRoutingFeatures = "both";
          };
        };
    };
}
