{
  ...
}:

{
  zen.hardware.boot.kernel = {
    description = ''
      boot settings
      kernel and this modules
    '';

    nixos =
      {
        pkgs,
        lib,
        ...
      }:
      {
        boot = {
          kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;

          tmp.cleanOnBoot = true;
          consoleLogLevel = 0;

          initrd = {
            verbose = false;

            compressor = "zstd";
            compressorArgs = [ "-16" ];
          };
        };
      };
  };
}
