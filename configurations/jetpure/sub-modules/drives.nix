{
  ...
}:

{
  zen.hosts.jetpure = {
    nixos =
      {
        lib,
        ...
      }:
      {
        fileSystems = lib.listToAttrs (
          lib.map
            (drive: {
              name = "/media/${drive}";
              value = {
                device = "/dev/disk/by-label/${drive}";
                options = [ "x-gvfs-show" ];
              };
            })
            [
              "fatKartman"
              "fastRider"
            ]
        );
      };
  };
}
