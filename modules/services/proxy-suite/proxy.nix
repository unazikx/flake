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

            selection = "selector";

            listenAddress = "0.0.0.0";
            port = 1020;

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
                tag = "France";
                urlFile = config.sops.secrets."vpn/france".path;
              }
            ];

            subscriptions = [
              # https://avencores.github.io/goida-vpn-site
              {
                tag = "Igreck";
                url = "https://github.com/AvenCores/goida-vpn-configs/raw/refs/heads/main/githubmirror/23.txt";
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

          zapret.perApp.enable = true;
        };

        sops.secrets = {
          "vpn/ashley-vpn" = { };
          "vpn/finland" = { };
          "vpn/france" = { };
        };
      };
  };
}
