{
  ...
}:

{
  zen.hardware.cpu-gpu.provides = {
    description = ''
      bluetooth aspect with frontend
    '';

    jetpure.nixos =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        hardware = {
          cpu.amd = {
            ryzen-smu.enable = true;
            updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
          };

          graphics = {
            enable = true;
            enable32Bit = true;

            extraPackages = [ pkgs.rocmPackages.clr.icd ];
          };
        };

        services = {
          # cpupower-gui.enable = true;
          lact.enable = true;
        };
      };
  };
}
