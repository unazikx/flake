{
  flake =
    {
      inputs,
      extendedLib,
      ...
    }:
    let
      configurationName = baseNameOf ./.;
    in
    {
      nixosConfigurations = extendedLib.buildConfiguration configurationName {
        hostName = "virualization";
        userName = "inlizator";
        hostPlatform = "x86_64-linux";

        extraModules = [
          inputs.microvm-nix.nixosModules.microvm
          (
            {
              pkgs,
              lib,
              ...
            }:
            {
              boot = {
                kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;
              };

              microvm = {
                hypervisor = "qemu";
                vcpu = 2;
                mem = 512;
              };
            }
          )
        ];
      };
    };
}
