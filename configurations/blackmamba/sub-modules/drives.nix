{
  ...
}:

{
  zen.hosts.blackmamba = {
    nixos =
      {
        ...
      }:
      {
        fileSystems = {
          "/media/samsaDisker" = {
            device = "/dev/disk/by-label/samsaDisker";
            fsType = "ext4";
            options = [
              "x-gvfs-show"
            ];
          };
        };
      };
  };
}
