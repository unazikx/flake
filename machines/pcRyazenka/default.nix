{
  flake =
    {
      extendedLib,
      config,
      ...
    }:
    {
      nixosConfigurations = extendedLib.buildConfiguration (baseNameOf ./.) {
        hostName = "jetpure";
        userName = "nixzoid";
        hostPlatform = "x86_64-linux";

        extraModules =
          (extendedLib.nxosLib.attrValues {
            inherit (config.nixosModules)
              # suites
              basic-shell
              desktop-hardware
              develop
              main-games
              niri-de
              office-env

              amneziawg
              caddy
              cava
              discord
              easyeffects
              fastfetch
              firefox
              flood
              gdu
              glance
              greetd
              helix
              minimal
              mpd
              mpv
              mumble
              obsidian
              qbittorrent
              qutebrowser
              rbw
              recordingScreen
              rezka-fzf
              rusted-tools
              sopsnix
              spotify
              spotify-player
              swayimg
              syncthing
              system-monitor
              tailscale
              telegram
              throne
              translate-shell
              trash-cmd
              tuir
              yazi
              zapret
              ;
          })
          ++ [
            (
              {
                inputs,
                lib,
                config,
                ...
              }:
              {
                stylix = {
                  polarity = "dark";
                  base16Scheme = inputs.base16."paradise";
                  image = lib.mkStylixImage inputs.wallpapers."townChristmas" config.lib.stylix.colors.toList;
                };

                sops.secrets = lib.mkSecrets.sopsnix [
                  "password"
                  "services/syncthing/cert"
                  "services/syncthing/key"
                  "tokens/hut"
                ] ./secrets.yaml;

                hm.services.syncthing.settings.devices = lib.listToAttrs [
                  (lib.syncthing.mkDevice "nothing2a" "E2PI7IQ-ZCKQW2J-MQF4OYZ-MFEPN4T-NNMF3LP-2TEHSM3-ZIN5VW2-6CRSRQM")
                  (lib.syncthing.mkDevice "blackmamba" "3PWM3G4-KOBIRI7-ZSS63JJ-EWQX5VX-BC5F772-76CZATP-XBP6QOX-HFCGPQN")
                  (lib.syncthing.mkDevice "windauser" "5NRFLQO-KFR4H7P-XGWMLNH-PSYDTNL-CF2D6JZ-PNEK76R-6DSYGSS-ZTFWQQF")
                ];

                fileSystems = lib.listToAttrs (
                  map
                    (name: {
                      name = "/media/${name}";
                      value =
                        {
                          inherit name;
                          options = [ "x-gvfs-show" ];
                        }
                        |> (
                          {
                            name ? throw "set label pls",
                            options ? [ ],
                          }:
                          {
                            device = "/dev/disk/by-label/${name}";
                            fsType = "ext4";
                            inherit options;
                          }
                        );
                    })
                    [
                      "fatKartman"
                      "fastRider"
                    ]
                );
              }
            )
          ];
      };

      diskoConfigurations.${baseNameOf ./.} = import ./disko.nix {
        device = toString /dev/disk/by-id/ata-KINGSTON_SA400S37240G_50026B72828C9A2D;
        # https://www.kingston.com/en/ssd/a400-solid-state-drive
      };
    };
}
