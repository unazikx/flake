{
  ...
}:

{
  zen.services.proxy-suite.proxy = {
    nixos =
      {
        config,
        ...
      }:
      {
        services.proxy-suite = {
          proxy = {
            enable = true;

            listenAddress = "0.0.0.0";
            port = 1080;

            singBox = {
              enable = true;
            };

            tun = {
              enable = true;
              perApp.enable = true;
            };

            tproxy = {
              enable = true;
              perApp.enable = true;
            };

            # INFO:
            # proxy-ctl select <tag>
            outbounds = [
              {
                tag = "Finland";
                urlFile = config.sops.secrets."vpn/finland".path;
              }
            ];
          };

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
        };
      };
  };
}
