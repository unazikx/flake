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
                  label = "boot-efi";

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

                swap = {
                  label = "swap-${host.hostName}";

                  size = "${toString host.hardware.ramSize}G";

                  content = {
                    type = "swap";
                    discardPolicy = "both";
                    resumeDevice = true;
                  };
                };

                root = {
                  label = "nixos-${host.hostName}";

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
