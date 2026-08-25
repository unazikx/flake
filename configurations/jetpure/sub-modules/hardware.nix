{
  ...
}:

{
  zen.hosts.jetpure = {
    nixos =
      {
        inputs,
        pkgs,
        ...
      }:
      {
        imports = [
          inputs.nixpkgs.nixosModules.notDetected
        ];

        boot = {
          kernelPackages =
            (pkgs.linuxKernel.packagesFor (
              let
                cachy = pkgs.cachyosKernels;
              in
              cachy.linux-cachyos-latest-lto-x86_64-v3
            )).extend
              (final: prev: { });

          tmp.cleanOnBoot = true;
          consoleLogLevel = 0;

          kernelModules = [
            "ntsync"
            "kvm-amd"
            "tun"
            "tap"
          ];

          kernelParams = [
            "acpi.sleep_state=3"
            "amdgpu.runpm=0"
            "mem_sleep_default=deep"
            "quiet"
            "acpi.ec_no_wakeup=1"
            "acpi_enforce_resources=lax"
          ];
        };
      };
  };
}
