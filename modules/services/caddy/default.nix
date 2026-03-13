# INFO:
# reverse proxy and server base
# with tls/ssl certificate
#
# https://service.hostName.local
# > http://localhost:port

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          config,
          ...
        }:
        {
          services.caddy = {
            enable = true;
            openFirewall = true;

            virtualHosts =
              lib.genAttrs
                [
                  "${lib.hostName}.local"
                ]
                (_: {
                  extraConfig =
                    if (config.services.glance.enable != true) then
                      ''
                        encode zstd gzip
                      ''
                    else
                      (toString null);
                });
          };
        };
    };
}
