# INFO:
# idk peer-2-peer network like torrents?

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
          persist.directories = [
            config.services.kubo.dataDir
          ];

          services.kubo = {
            enable = true;

            # dataDir = lib.mkDefault (toString /media/IPFS);

            autoMount = true;
            localDiscovery = true;

            settings = {
              # https://github.com/kraftwerk-gaming/strom#setting-up-an-ipfs-node-with-kubo
              Experimental.FilestoreEnabled = true;
            };
          };

          networking.firewall = lib.genAttrs [
            "allowedTCPPorts"
            "allowedUDPPorts"
          ] (_: [ 4001 ]);
        };
    };
}
