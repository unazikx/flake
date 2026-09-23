{
  zen,
  ...
}:

{
  zen.services.proxy-suite.tor = {
    includes = [
      zen.services.proxy-suite
      zen.services.proxy-suite.proxy
    ];

    nixos =
      {
        config,
        ...
      }:
      {
        services.proxy-suite = {
          tor = {
            enable = true;
            asOutbound = true;

            bridges.file = config.sops.secrets."services/tor-bridges".path;
          };
        };

        sops.secrets = {
          "services/tor-bridges" = { };
        };
      };
  };
}
