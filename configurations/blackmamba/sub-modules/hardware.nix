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
