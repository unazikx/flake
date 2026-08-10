{
  ...
}:

{
  zen.disko.default = {
    diskoUSB =
      {
        ...
      }:
      let
        drive = "/dev/disk/by-id/usb-General_USB_Flash_Disk_05335000000032F6-0:0";
        name = "usb8gb";
      in
      {
        "${name}".disko.devices.disk = {
          "${baseNameOf drive}" = {
            device = drive;

            type = "disk";

            content = {
              type = "gpt";

              partitions = {
                root = {
                  label = "flash-${name}";

                  size = "100%";

                  content = {
                    type = "filesystem";
                    format = "exfat";
                  };
                };
              };
            };
          };
        };
      };
  };
}
