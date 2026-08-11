{
  ...
}:

{
  zen.hosts.blackmamba = {
    nixos =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.nixpkgs.nixosModules.notDetected
          inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen1
        ];

        boot = {
          tmp.cleanOnBoot = true;
          consoleLogLevel = 0;

          kernelModules = [
            "ntsync"
            "kvm-amd"
            "tun"
            "tap"
          ];

          kernelParams = [
            "mem_sleep_default=deep"
            "quiet"
          ];
        };
      };
  };
}
