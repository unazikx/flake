# INFO:
# creates vpn (local network) for multiple devices
#
# configuring via
# https://login.tailscale.com/admin/machines

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
