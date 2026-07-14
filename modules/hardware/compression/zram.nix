{
  ...
}:

{
  zen.hardware.compression.zram = {
    description = ''
      compress ram with zstd
    '';

    nixos =
      {
        ...
      }:
      {
        zramSwap = {
          enable = true;

          algorithm = "zstd";
          memoryPercent = 75;
          priority = 1000;
          swapDevices = 1;
        };
      };
  };
}
