{
  ...
}:

{
  zen.hardware.printing = {
    description = ''
      drivers and webui for control printers
    '';

    nixos =
      {
        pkgs,
        ...
      }:
      {
        services = {
          ipp-usb.enable = true;

          printing = {
            enable = true;
            drivers = [
              pkgs.epson-escpr
              pkgs.epson-escpr2
              pkgs.epson_201207w
            ];
          };
        };

        hardware.printers = {
          ensureDefaultPrinter = "EPSON-L300";
          ensurePrinters = [
            {
              name = "EPSON-L300";
              location = "home";

              model = "epson-inkjet-printer-201207w/ppds/EPSON_L300.ppd";
              deviceUri = "usb://EPSON/L300%20Series?serial=53334D4B3031333924";

              ppdOptions = {
                PageSize = "A4";
              };
            }
          ];
        };
      };

    user =
      {
        ...
      }:
      {
        extraGroups = [ "lpadmin" ];
      };
  };
}
