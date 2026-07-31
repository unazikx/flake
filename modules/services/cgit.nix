{
  ...
}:

{
  zen.services.cgit = {
    description = ''
      reverse proxy and server base
      with tls/ssl certificate

      https://service.hostName.local
      > http://localhost:port
    '';

    nixos =
      {
        host,
        ...
      }:
      {
        services.cgit.default = {
          enable = true;

          gitHttpBackend.checkExportOkFiles = false;

          repos = {
            flake = {
              desc = "My own flake repository";
              path = host.flakeDir;
            };
          };
        };
      };
  };
}
