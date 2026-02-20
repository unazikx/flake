{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          ...
        }:
        {
          persist.directories = [
            "/var/lib/plymouth"
          ];

          boot = {
            kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;

            loader = {
              timeout = lib.mkForce 1;
              efi.canTouchEfiVariables = true;

              systemd-boot = {
                enable = true;

                configurationLimit = 4;
              };
            };

            tmp.cleanOnBoot = true;
            consoleLogLevel = 0;

            kernelModules = [
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

            initrd = {
              verbose = false;

              compressor = "zstd";
              compressorArgs = [ "-16" ];
            };

            plymouth = {
              enable = true;

              logo =
                let
                  path = "${pkgs.nixos-icons}/share/icons/hicolor/48x48/apps/";
                in
                path + "nix-snowflake-white.png";
            };
          };
        };
    };
}
