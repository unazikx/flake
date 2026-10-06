{
  zen,
  ...
}:

{
  den.hosts.microvana = {
    system = "x86_64-linux";
    class = "nixos";
  };

  zen.hosts.microvana = {
    includes = [
      zen.miscellaneous.minimal
      zen.miscellaneous.nix
      zen.miscellaneous.nix.settings
      zen.miscellaneous.nix.substituters
      zen.miscellaneous.version
    ];

    nixos =
      {
        inputs,
        pkgs,
        ...
      }:
      {
        imports = [
          inputs.microvm-nix.nixosModules.microvm
        ];

        boot.kernelPackages = pkgs.linuxPackages_zen;
        networking.useNetworkd = true;

        users.users = {
          root = {
            hashedPassword = "$y$j9T$dWUMGl9.U1oaGK6.UzaGz.$S8sBebLl3r7g.NgXYKtTtp2iJPLEqVSJrkb6F/R.7jC";
          };
        };

        microvm = {
          vcpu = 2;
          hypervisor = "qemu";
        };
      };

    disko =
      {
        ...
      }:
      { };
  };
}
