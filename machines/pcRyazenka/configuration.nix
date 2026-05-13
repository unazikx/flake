{
  flake =
    {
      config,
      ...
    }:
    let
      configurationName = baseNameOf ./.;
    in
    {
      nixosConfigurations = config.lib.buildNixos configurationName {
        hostName = "jetpure";
        userName = "nixzoid";
        hostPlatform = "x86_64-linux";

        extraModules = builtins.attrValues {
          inherit (config.nixosModules)
            # keep-sorted start
            basic-media
            basic-services
            basic-shell
            desktop-hardware
            develop
            main-games
            niri-de
            office-env
            # keep-sorted end

            # keep-sorted start
            amneziawg
            cava
            discord
            fastfetch
            firefox
            flood
            gdu
            helix
            minimal
            nixos-cli
            obsidian
            qbittorrent
            qutebrowser
            rbw
            recordingScreen
            rezka-fzf
            rusted-tools
            sopsnix
            spotify
            syncthing
            system-monitor
            tailscale
            telegram
            throne
            translate-shell
            trash-cmd
            tuir
            yazi
            ytsub
            zapret
            # keep-sorted end
            ;

          disko = config.diskoConfigurations.${configurationName};

          # INFO:
          # nixos options and config
          _systemConfig =
            {
              self,
              pkgs,
              lib,
              config,
              ...
            }:
            {
              stylix = {
                polarity = "dark";

                base16Scheme = import "${self}/modules/themes/base16/paradise.nix";

                image = lib.mkStylixImage (pkgs.fetchurl {
                  url = "https://w.wallhaven.cc/full/og/wallhaven-ogl5z9.png";
                  sha256 = "sha256-VvnBCulYtyVqJOQ5psLJyIvK8YffWPP8Stz9KgznGcY=";
                }) config.lib.stylix.colors.toList;
              };

              sops.secrets = import ./secrets.nix {
                inherit lib;
              };

              hm.services.syncthing.settings.devices =
                with lib.mkSyncthing;
                lib.listToAttrs [
                  (device "nothing2a" "E2PI7IQ-ZCKQW2J-MQF4OYZ-MFEPN4T-NNMF3LP-2TEHSM3-ZIN5VW2-6CRSRQM")
                  (device "blackmamba" "3PWM3G4-KOBIRI7-ZSS63JJ-EWQX5VX-BC5F772-76CZATP-XBP6QOX-HFCGPQN")
                  (device "windauser" "5NRFLQO-KFR4H7P-XGWMLNH-PSYDTNL-CF2D6JZ-PNEK76R-6DSYGSS-ZTFWQQF")
                ];

              fileSystems = lib.mkDevices.byName [
                "fatKartman"
                "fastRider"
              ];

              programs.steam.config.nonSteamApps = {
                super-tux-kart.enable = true;
                mindustry.enable = true;
              };
            };
        };
      };

      diskoConfigurations = config.lib.buildDisko configurationName {
        path = ./disko.nix;
        device = toString /dev/disk/by-id/ata-KINGSTON_SA400S37240G_50026B72828C9A2D;
        # https://www.kingston.com/en/ssd/a400-solid-state-drive
      };
    };
}
