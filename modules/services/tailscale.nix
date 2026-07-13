{
  ...
}:

{
  zen.services.tailscale = {
    description = ''
      creates vpn (local network) for multiple devices

      configuring via
      https://login.tailscale.com/admin/machines
    '';

    nixos =
      {
        ...
      }:
      {
        services.tailscale = {
          enable = true;
          openFirewall = true;

          useRoutingFeatures = "both";
        };
      };
  };
}
