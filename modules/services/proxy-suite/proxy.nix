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
              {
                tag = "Sweden";
                urlFile = config.sops.secrets."vpn/sweden".path;
              }
              {
                tag = "Kazakhstan";
                urlFile = config.sops.secrets."vpn/kazakhstan".path;
              }
            ];

            subscriptions = [
              # https://github.com/AvenCores/goida-vpn-configs/blob/main/source/config/urls.json
              {
                tag = "OpenProxyList";
                url = "https://raw.githubusercontent.com/roosterkid/openproxylist/main/V2RAY_RAW.txt";
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

        sops.secrets = {
          "vpn/finland" = { };
          "vpn/kazakhstan" = { };
          "vpn/sweden" = { };
          "vpn/mifa/vless" = { };
        };
      };
  };
}
