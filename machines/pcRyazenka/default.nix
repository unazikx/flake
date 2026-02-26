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

        winePrefix = toString /media/fatKartman/UnifiedPrefix;
        stylix = {
          theme = "paradise";
          image = "townChristmas";
        };

        extraModules =
          (extendedLib.nxosLib.attrValues {
            inherit (config.nixosModules)
              # suites
              basicShell
              desktopHardware
              develop
              mainGames
              niriDE
              officeEnv

              caddy
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
              qbittorrent
              qutebrowser
              rbw
              rezkaFzf
              rustedTools
              sopsnix
              spotify
              swayimg
              syncthing
              systemMonitor
              tailscale
              telegram
              translateShell
              trashCmd
              tuir
              yazi
              zapret
              ;
          })
          ++ [
            (
              { lib, ... }:
              {
                sops.secrets = lib.mkSecrets.sopsnix [
                  "password"
                  "syncthing/cert"
                  "syncthing/key"
                  "tokens/hut"
                ] ./secrets.yaml;

                hm.services.syncthing.settings.devices = lib.listToAttrs [
                  (lib.syncthing.mkDevice "nothing2a" "U2SSOJT-I43YCNB-HAU4LBI-6UWBLRR-AUTELXZ-PZSCFYJ-J3LKH5H-ROFZBQS")
                  (lib.syncthing.mkDevice "blackmamba" "3PWM3G4-KOBIRI7-ZSS63JJ-EWQX5VX-BC5F772-76CZATP-XBP6QOX-HFCGPQN")
                  (lib.syncthing.mkDevice "windauser" "5NRFLQO-KFR4H7P-XGWMLNH-PSYDTNL-CF2D6JZ-PNEK76R-6DSYGSS-ZTFWQQF")
                ];
              }
            )

            (
              let
                mk =
                  {
                    name ? throw "set label pls",
                    options ? [ ],
                  }:
                  {
                    device = "/dev/disk/by-label/${name}";
                    fsType = "ext4";
                    inherit options;
                  };
              in
              { lib, ... }:
              {
                fileSystems = lib.listToAttrs (
                  map
                    (name: {
                      name = "/media/${name}";
                      value = mk {
                        inherit name;
                        options = [ "x-gvfs-show" ];
                      };
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
