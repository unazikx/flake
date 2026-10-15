{
  ...
}:

{
  zen.services.rqbit = {
    description = ''
      bittorrent client in rust
    '';

    nixos =
      {
        lib,
        ...
      }:
      {
        services.rqbit = {
          enable = true;

          downloadDir = "/media/torrents" |> lib.mkDefault;
        };
      };
  };
}
