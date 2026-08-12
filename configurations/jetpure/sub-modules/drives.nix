{
  ...
}:

{
  zen.hosts.jetpure = {
    nixos =
      {
        ...
      }:
      {
        fileSystems = {
          "fatKartman" = {
            device = "/dev/disk/by-label/fatKartman";
            fsType = "ext4";
            options = [
              "x-gvfs-show"
            ];
          };

          "fastRider" = {
            device = "/dev/disk/by-label/fastRider";
            fsType = "ext4";
            options = [
              "x-gvfs-show"
            ];
          };
        };
      };
  };
}
