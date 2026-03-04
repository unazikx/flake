# INFO:
# zram0       253:0    0  31.3G  0 disk [SWAP]
# fuck....

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          ...
        }:
        {
          zramSwap = {
            enable = true;

            algorithm = "zstd";
            memoryPercent = 100;
            priority = 1000;
            swapDevices = 1;
          };
        };
    };
}
