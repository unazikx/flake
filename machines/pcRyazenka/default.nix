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

              discord
              easyeffects
              fastfetch
              firefox
              flood
              gdu
              greetd
              helix
              minimalDocs
              mpv
              mumble
              qbittorrent
              qutebrowser
              rbw
              rezkaFzf
              sopsnix
              swayimg
              systemMonitor
              tailscale
              telegram
              translateShell
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
