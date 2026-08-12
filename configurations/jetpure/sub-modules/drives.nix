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
          "/media/fatKartman" = {
            device = "/dev/disk/by-label/fatKartman";
            fsType = "ext4";
            options = [
              "x-gvfs-show"
            ];
          };

          "/media/fastRider" = {
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
