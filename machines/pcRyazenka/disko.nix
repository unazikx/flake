{
  device,
  ...
}:

{
  disko.devices.disk = {
    disko = {
      inherit device;

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
}
