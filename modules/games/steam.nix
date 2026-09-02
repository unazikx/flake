{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    steam-config-nix = {
      type = "github";
      owner = "different-name";
      repo = "steam-config-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    # keep-sorted end
  };

  zen.games.steam = {
    description = ''
      for unified prefix use:
      STEAM_COMPAT_DATA_PATH=your_path_withouts_strings_around %command%

      config options:
      https://github.com/different-name/steam-config-nix/blob/master/options.md
    '';

    includes = [
      zen.games.gamemode
      zen.games.mangohud
      zen.games.steam-config
    ];

    wiki = {
      "Steam".links = [
        # keep-sorted start block=yes
        {
          name = "arch-steam";
          url = "https://wiki.archlinux.org/title/Steam";
          logo = "https://www.vhv.rs/dpng/d/76-762941_archlinux-icon-crystal-arch-linux-icon-png-transparent.png";
        }
        {
          name = "jovian-nixos";
          url = "https://github.com/Jovian-Experiments/Jovian-NixOS";
          logo = "https://images.seeklogo.com/logo-png/40/2/steam-deck-logo-png_seeklogo-409559.png";
        }
        {
          name = "steam-db";
          url = "https://steamdb.info";
          logo = "https://wiki.archiveteam.org/images/d/d8/SteamDB_logo.png";
        }
        {
          name = "proton-db";
          url = "https://protondb.com";
          logo = "https://www.protondb.com/sites/protondb/images/site-logo.svg";
        }
        # keep-sorted end
      ];
    };

    nixos =
      {
        self',
        pkgs,
        ...
      }:
      {
        programs = {
          steam = {
            enable = true;

            extraCompatPackages = [
              self'.packages.proton-ge-patched
            ];

            remotePlay.openFirewall = true;

            protontricks = {
              enable = true;
            };

            gamescopeSession = {
              enable = true;

              env = {
                WINE_FULLSCREEN_FSR = "1";
              };

              args = [
                "-e"
              ];
            };
          };

          gamescope = {
            enable = true;
          };
        };

        environment.systemPackages = [
          # WARN:
          # idk it isnt works
          (pkgs.writeShellScriptBin "steamos-session-select" ''
            steam -shutdown
          '')
        ];
      };
  };
}
