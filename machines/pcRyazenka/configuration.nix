{
  inputs,
  ...
}:

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
            amneziawg
            basic-media
            basic-services
            basic-shell
            cava
            desktop-hardware
            develop
            discord
            fastfetch
            firefox
            flood
            gdu
            helix
            kubo
            main-games
            minecraft-servers
            minimal
            nilla
            nixos-cli
            obsidian
            office-env
            proxy-suite
            qbittorrent
            qutebrowser
            rbw
            recordingScreen
            rezka-fzf
            rusted-tools
            sopsnix
            spotify
            sway-de
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
            # keep-sorted end
            ;

          disko = config.diskoConfigurations.${configurationName};

          files = inputs.import-tree ./_files;

          secrets =
            {
              lib,
              ...
            }:
            {
              sops.secrets = import ./secrets.nix {
                inherit lib;
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
