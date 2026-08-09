{
  ...
}:

{
  zen.hardware.compression.zswap = {
    description = ''
      compress swap with zstd
    '';

    nixos =
      {
        ...
      }:
      {
        boot.zswap = {
          enable = true;

          maxPoolPercent = 25;
          acceptThresholdPercent = 90;
          compressor = "zstd";
        };
      };
  };
}
