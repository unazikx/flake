{
  ...
}:

{
  zen.hosts.declaoke = {
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
          kernelPackages = pkgs.linuxPackages_zen;

          tmp.cleanOnBoot = true;
          consoleLogLevel = 0;

          kernelModules = [
            "tun"
          ];

          kernelParams = [
            "quiet"
          ];
        };
      };
  };
}
