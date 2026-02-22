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

            virtualHosts =
              lib.genAttrs
                [
                  "${lib.hostName}"
                  "localhost:443"
                ]
                (_: {
                  extraConfig =
                    if (config.services.glance.enable != true) then
                      ''
                        file_server
                      ''
                    else
                      (toString null);
                });
          };
        };
    };
}
