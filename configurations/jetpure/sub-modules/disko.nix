{
  ...
}:

{
  zen.hosts.jetpure = {
    nixos =
      {
        host,
        ...
      }:
      {
        disko.devices.disk = {
          disko = {
            device = host.drive;

            type = "disk";

            content = {
              type = "gpt";

              partitions = {
                esp = {
                  size = "512M";
                  type = "EF00";

                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";

                    mountOptions = [
                      "defaults"
                      "umask=0077"
                    ];
                  };
                };

                root = {
                  size = "100%";

                  content = {
                    type = "filesystem";
                    format = "ext4";
                    mountpoint = "/";
                  };
                };
              };
            };
          };
        };
      };
  };
}
