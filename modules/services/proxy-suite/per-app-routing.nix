{
  ...
}:

{
  zen.services.proxy-suite.per-app-routing = {
    nixos =
      {
        ...
      }:
      {
        services.proxy-suite = {
          perAppRouting = {
            enable = true;

            profiles = [
              {
                name = "tun";
                route = "tun";
              }
              {
                name = "zapret";
                route = "zapret";
              }
              {
                name = "direct";
                route = "direct";
              }
            ];
          };
        };
      };
  };
}
