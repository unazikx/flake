{
  ...
}:

{
  zen.hardware.mounting = {
    description = ''
      tools for seamless drives mounting
      default to /media/drive-name
    '';

    nixos =
      {
        ...
      }:
      {
        services = {
          gvfs.enable = true;

          udisks2 = {
            enable = true;

            mountOnMedia = true;
          };
        };
      };
  };
}
