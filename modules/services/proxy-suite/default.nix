# INFO:
# bundles sing-box, zapret-discord-youtube, and tg-ws-proxy

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          config,
          ...
        }:
        {
          services.proxy-suite = {
            enable = true;

            singBox = {
              outbounds = [
                # WARN:
                # needs to fill
                # ...
              ];
            };

            zapret = {
              enable = true;

              # configName = "general(ALT)";
              gameFilter = "all";

              # syncDirectRouting = true;
              # syncDirectRoutingUpstreamIps = false;
              # syncDirectRoutingUserIps = true;
            };

            tgWsProxy = {
              # INFO:
              # connect via this link
              # https://t.me/proxy?server=127.0.0.1&port=1443&secret=dda95d4572bdc10eebaa57192dd9384095
              enable = true;

              host = "127.0.0.1";
              port = 1443;

              # WARN: generate via
              # nix run nixpkgs#openssl -- rand -hex 16
              secretFile = config.sopsnix."services/telegram-ws-proxy";
            };

            tray = {
              enable = true;

              autostart = true;
              pollInterval = 5;
            };
          };
        };
    };
}
