# INFO:
# bittorrent client in rust

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          ...
        }:
        let
          savePath = "/media/torrents";
        in
        {
          services.rqbit = {
            enable = true;

            downloadDir = savePath;
          };
        };
    };
}
