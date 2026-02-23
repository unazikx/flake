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
                        file_server
                      ''
                    else
                      (toString null);
                });
          };
        };
    };
}
