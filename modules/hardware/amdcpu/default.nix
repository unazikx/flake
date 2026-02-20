{
  flake =
    {
      ...
    }:
    {
      # INFO:
      # module for amdcpu
      # optimizations
      nixosModules.${baseNameOf ./.} =
        {
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
          };
        };
    };
}
