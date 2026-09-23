{
  ...
}:

{
  zen.services.proxy-suite.per-app = {
    nixos =
      {
        ...
      }:
      {
        services.proxy-suite = {
          perAppRouting = {
            enable = true;

            createDefaultProfiles = true;
            proxychains.enable = true;

            profiles = [
              {
                name = "tun";
                route = "tun";
              }
              {
                name = "tproxy";
                route = "tproxy";
              }
              {
                name = "direct";
                route = "direct";
              }
            ];
          };

          zapret.perApp.enable = true;
        };
      };
  };
}
