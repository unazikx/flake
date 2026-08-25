{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    cachyos-kernel-nix = {
      type = "github";
      owner = "xddxdd";
      repo = "nix-cachyos-kernel";
      ref = "release";
      inputs.flake-parts.follows = "flake-parts";
    };
    # keep-sorted end
  };

  zen.hardware.boot.kernel = {
    description = ''
      boot settings
      kernel and this modules
    '';

    nixos =
      {
        inputs,
        pkgs,
        lib,
        ...
      }:
      {
        boot = {
          kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;

          tmp = {
            cleanOnBoot = true;
            useTmpfs = true;
            tmpfsSize = "50%";
          };

          consoleLogLevel = 0;

          initrd = {
            verbose = false;

            compressor = "zstd";
            compressorArgs = [ "-16" ];
          };
        };

        nixpkgs.overlays = [
          inputs.cachyos-kernel-nix.overlays.pinned
        ];
      };
  };
}
