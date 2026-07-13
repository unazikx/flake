{
  ...
}:

{
  zen.services.caddy = {
    description = ''
      reverse proxy and server base
      with tls/ssl certificate

      https://service.hostName.local
      > http://localhost:port
    '';

    nixos =
      {
        lib,
        config,
        ...
      }:
      {
        services.caddy = {
          enable = true;
          openFirewall = true;
        };

        networking.hosts = {
          "127.0.0.1" = lib.attrNames config.services.caddy.virtualHosts;
        };
      };
  };
}
