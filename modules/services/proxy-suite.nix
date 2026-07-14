{
  ...
}:

{
  flake-file.inputs = {
    proxy-suite-flake = {
      type = "github";
      owner = "fufsob";
      repo = "proxy-suite-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  zen.services.glance = {
    description = ''
      bundles sing-box,
      zapret-discord-youtube,
      and tg-ws-proxy
    '';

    nixos =
      {
        inputs,
        config,
        ...
      }:
      {
        imports = [
          inputs.proxy-suite-flake.nixosModules.default
        ];

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
            secretFile = config.sops.secrets."services/telegram-ws".path;
          };

          zapret = {
            enable = true;

            configName = "general (ALT12)";
            gameFilter = if config.programs.steam.enable then "all" else "null";
          };
        };

        sops.secrets."services/telegram-ws" = { };
      };
  };
}
