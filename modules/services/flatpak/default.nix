# INFO:
# self packages in containers
# or not...idk isolated
# declarative, ye

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
        {
          persist.directories = [
            "/var/lib/flatpak"
          ];

          services.flatpak = {
            enable = true;

            update.onActivation = true;
            uninstallUnmanaged = true;

            remotes = lib.mkOptionDefault [
              {
                name = "flathub-beta";
                location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
              }
            ];

            packages = lib.attrValues {
              sober = (
                lib.mkIf false {
                  flatpakref = "https://sober.vinegarhq.org/sober.flatpakref";
                  sha256 = "1pj8y1xhiwgbnhrr3yr3ybpfis9slrl73i0b1lc9q89vhip6ym2l";
                }
              ); # roblox (android edition)

              hytale = (
                lib.mkIf false rec {
                  appId = "com.hytale.Launcher";
                  sha256 = "0pw1f4p5902hd9am1hnvmxy7271vf2xgyvszdj17zndwp56ij5l8";

                  bundle = "${pkgs.fetchurl {
                    url = "https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-latest.flatpak";
                    inherit
                      sha256
                      ;
                  }}";
                }
              ); # 7 years of waiting, finally, use config.nixosModules.hytale
            };

            overrides.global = {
              Context = {
                filesystems = [
                  "${config.hm.home.homeDirectory}:rw"
                  "/media/disks:rw"
                ];

                sockets = [
                  "wayland"
                  "!x11"
                  "!fallback-x11"
                ];
              };
            };
          };
        };
    };
}
