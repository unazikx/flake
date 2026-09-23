{
  zen,
  ...
}:

{
  zen.services.proxy-suite.vpn = {
    includes = [
      zen.services.proxy-suite.per-app
      zen.services.proxy-suite.proxy
    ];

    nixos =
      {
        ...
      }:
      {
        services.proxy-suite = {
          proxy = {
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
              # host exclusive
            ];

            subscriptions = [
              # https://avencores.github.io/goida-vpn-site
              {
                tag = "Igreck";
                url = "https://github.com/AvenCores/goida-vpn-configs/raw/refs/heads/main/githubmirror/23.txt";
              }
            ];
          };
        };
      };
  };
}
