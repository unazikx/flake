{
  ...
}:

{
  zen.services.kubo = {
    description = ''
      p2p network?
      alike torrent?
    '';

    nixos =
      {
        ...
      }:
      {
        services.kubo = {
          enable = true;

          autoMount = true;
          localDiscovery = true;

          settings = {
            # https://github.com/kraftwerk-gaming/strom#setting-up-an-ipfs-node-with-kubo
            Experimental.FilestoreEnabled = true;
          };
        };
      };
  };
}
