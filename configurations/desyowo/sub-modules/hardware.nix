{
  ...
}:

{
  zen.hosts.desyowo = {
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
              (_final: _prev: { });

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
