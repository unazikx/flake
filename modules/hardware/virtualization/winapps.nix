{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    winapps = {
      type = "github";
      owner = "winapps-org";
      repo = "winapps";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    # keep-sorted end
  };

  zen.hardware.virtualization.winapps = {
    description = ''
      windows11 in qemu that in podman
      idk will it works or not
    '';

    includes = [
      zen.hardware.virtualization.podman
    ];

    nixos =
      {
        self,
        inputs',
        pkgs,
        lib,
        config,
        host,
        ...
      }:
      {
        environment.systemPackages = [
          inputs'.winapps.packages.winapps
          inputs'.winapps.packages.winapps-launcher
          pkgs.freerdp
        ];

        virtualisation.oci-containers = {
          containers."WinApps" = {
            # https://github.com/winapps-org/winapps/blob/1b38cab1b8c1a513e4a313931759ac4942473678/setup.sh#L1007
            autoStart = false;

            image = "ghcr.io/dockur/windows:latest";

            environment = {
              "VERSION" = "core11";
              "CPU_CORES" = "4";

              "RAM_SIZE" = "4G";
              "DISK_SIZE" = "32G";

              "REGION" = "en-US";
              "KEYBOARD" = "en-US";
            };

            ports = [
              "8006:8006"
              "3389:3389/tcp"
              "3389:3389/udp"
            ];

            devices = [
              "/dev/dri"
              "/dev/kvm"
              "/dev/net/tun"
            ];

            extraOptions = [
              "--cap-add=NET_ADMIN"
              "--cap-add=CAP_NET_RAW"
              "--device=/dev/kvm:rw"
            ];

            volumes = [
              "${host.flakeDir}:/flake:ro"
              "/media:/media:rw"

              # WARN:
              # idk it cant let install os
              #
              # "${
              #   pkgs.symlinkJoin {
              #     name = "oem-for-winapps";
              #     paths = [
              #       "${inputs.winapps}/oem"
              #       (if (lib.pathExists ./oem) then ./oem else (toString null))
              #     ];
              #   }
              # }:/oem:ro"
            ];

            environmentFiles = [
              config.sops.templates."winapps-env".path
            ];
          };
        };

        sops.secrets =
          lib.genAttrs
            [
              "windows/username"
              "windows/password"
            ]
            (_: {
              sopsFile = "${self}/secrets/shared/sops.yaml";
            });

        sops.templates = {
          "winapps-env".content =
            # env
            ''
              USERNAME=${config.sops.placeholder."windows/username"}
              PASSWORD=${config.sops.placeholder."windows/password"}
            '';
        };
      };

    homeManagerNixos =
      {
        self,
        lib,
        config,
        osConfig,
        ...
      }:
      {
        xdg.configFile = {
          "winapps/winapps.env".source =
            config.lib.file.mkOutOfStoreSymlink
              config.sops.templates."winapps-env".path;

          "winapps/winapps.conf".source =
            config.lib.file.mkOutOfStoreSymlink
              config.sops.templates."winapps-conf".path;
        };

        sops.secrets =
          lib.genAttrs
            [
              "windows/username"
              "windows/password"
            ]
            (_: {
              sopsFile = "${self}/secrets/shared/sops.yaml";
            });

        sops.templates = {
          "winapps-env".content =
            # env
            ''
              PASSWORD=${config.sops.placeholder."windows/password"}
            '';

          "winapps-conf".content =
            # conf
            ''
              RDP_USER="${config.sops.placeholder."windows/username"}"
              RDP_PASS="${config.sops.placeholder."windows/password"}"
              WAFLAVOR="${osConfig.virtualisation.oci-containers.backend}"
              VM_NAME="RDPWindows"
              REMOVABLE_MEDIA="/run/media"
              APP_SCAN_TIMEOUT="60"
              BOOT_TIMEOUT="120"
              PORT_TIMEOUT="5"
              RDP_FLAGS="/cert:tofu /sound /microphone"
              RDP_IP="127.0.0.1"
              RDP_SCALE="100"
              RDP_TIMEOUT="30"
            '';
        };
      };

    provides.to-users = {
      nixos =
        {
          user,
          ...
        }:
        {
          virtualisation.oci-containers = {
            containers."WinApps" = {
              volumes = [
                "/home/${user.userName}:/shared:rw"
              ];
            };
          };
        };
    };

    # provides.jetpure = {
    #   nixos =
    #     {
    #       config,
    #       ...
    #     }:
    #     let
    #       storage = "${config.fileSystems."/media/fatKartman".mountPoint}/winapps";
    #     in
    #     {
    #       virtualisation.oci-containers = {
    #         containers.winapps.volumes = [
    #           "${storage}:/storage"
    #         ];
    #       };

    #       systemd.tmpfiles.rules = [
    #         "d ${storage} 0755 - - -"
    #       ];

    #       system.activationScripts.winapps-oem =
    #         # bash
    #         ''
    #           chattr +C ${storage}/windows/data 2>/dev/null || true
    #         '';
    #     };
    # };
  };
}
