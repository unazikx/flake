{
  ...
}:

{
  zen.hardware.bluetooth = {
    description = ''
      bluetooth aspect with frontend
    '';

    nixos =
      {
        pkgs,
        ...
      }:
      {
        environment.systemPackages = [
          pkgs.bluetui
        ];

        hardware.bluetooth = {
          enable = true;
          powerOnBoot = true;

          settings = {
            General = {
              Experimental = true;
              Enable = "Source,Sink,Media,Socket";
              Privacy = "device";
              JustWorksRepairing = "always";
              Class = "0x000100";
              FastConnectable = true;
            };

            LE = {
              MinConnectionInterval = 7;
              MaxConnectionInterval = 9;
              ConnectionLatency = 0;
            };
          };
        };
      };
  };
}
