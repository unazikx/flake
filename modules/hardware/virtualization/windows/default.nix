# INFO:
# windows in podman
# idk would i use libvirt or not
#
# INFO:
# 1) enable this module
# 2) wait for rebuild
# 3) watch 'systemctl status podman-windows.service'
# 4) enter to http://localhost:8006
# 5) your windows is ready
# 6) to activate windows open powershell and type
#    > iex (curl.exe -s --doh-url https://1.1.1.1/dns-query https://get.activated.win | Out-String)

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
          config,
          ...
        }:
        let
          customIso = "${pkgs.own.windows-iso.tiny11}/bin/tiny11.iso";
          # only as path when local, not string
          # when url then string
          # > /media/torrents/tiny11_25H2/tiny11core_25H2_Oct25.iso
          #
          # or other windows
          # https://archive.org/download/tiny11_25H2/tiny11core_25H2_Oct25.iso # win11 25H2 core
          # https://archive.org/download/tiny11_25H2/tiny11_25H2_Oct25.iso # win11 22H2
          # https://archive.org/download/tiny-10-23-h2/tiny10%20x64%2023h2.iso # win10 23H2
        in
        {
          networking.firewall.allowedTCPPorts = [ 3389 ];

          virtualisation.oci-containers.containers = {
            "windows" = {
              autoStart = false;
              # INFO: will be sopped on boot
              # > systemctl start podman-windows.service
              # to start container

              image = "ghcr.io/dockur/windows:latest";

              environment = {
                "VERSION" = "tiny11"; # by default

                "CPU_CORES" = (toString 8);
                "RAM_SIZE" = (toString 8) + "G";
                "DISK_SIZE" = (toString (8 * 8)) + "G";

                "HOME" = config.hm.home.homeDirectory;
                # "PASSWORD" & "USERNAME" automatically sets from secret

                "REGION" = "en-US";
                "KEYBOARD" = "en-US";

                "GPU" = "Y";
              };

              environmentFiles = [ config.sopsnix."services/windows" ];
              # secret like this
              #
              # services:
              #   windows: |
              #     USERNAME=windauser
              #     PASSWORD=fuckmicosoft

              volumes = [
                "${config.hm.home.homeDirectory}:/shared:rw"
                "/media:/media:rw"
              ]
              # custom local iso of windows
              ++ (lib.optional (lib.isPath customIso) "${toString customIso}:/custom.iso");

              devices = [
                "/dev/dri"
                "/dev/vfio"
                "/dev/kvm"
                "/dev/net/tun"
              ];

              ports = [
                "8006:8006/tcp"
                "3389:3389/tcp"
                "3389:3389/udp"
              ];

              extraOptions = [
                "--cap-add=NET_ADMIN"

                "--network-alias=windows"
                "--privileged"
              ];
            };
          };
        };
    };
}
