{
  zen,
  ...
}:

{
  zen.services.proxy-suite.per-app = {
    includes = [
      zen.services.proxy-suite.tg-ws-proxy
    ];

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
