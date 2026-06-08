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
        let
          inherit (config.programs)
            steam
            ;
        in
        {
          services.proxy-suite = {
            enable = true;

            proxy = {
              singBox.enable = false;
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

            zapret = {
              enable = true;

              configName = "general (ALT12)";
              gameFilter = if steam.enable then "all" else "null";
            };
          };
        };
    };
}
