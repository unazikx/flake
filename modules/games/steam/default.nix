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
      zen.games.steam.non-steam-games
      zen.games.steam.steam-games
    ];

    wiki = {
      "Steam".links = [
        # keep-sorted start block=yes newline_separated=yes
        {
          name = "arch-steam";
          url = "https://wiki.archlinux.org/title/Steam";
        }

        {
          name = "jovian-nixos";
          url = "https://github.com/Jovian-Experiments/Jovian-NixOS";
        }

        {
          name = "proton-db";
          url = "https://protondb.com";
        }

        {
          name = "steam-config-nix";
          url = "https://github.com/different-name/steam-config-nix/blob/master/options.md";
        }

        {
          name = "steam-db";
          url = "https://steamdb.info";
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

    homeManagerNixos =
      {
        self',
        inputs,
        lib,
        osConfig,
        ...
      }:
      {
        imports = [
          inputs.steam-config-nix.homeModules.steam-config-nix
        ];

        programs.steam.config = {
          enable = true;
          onSteamRunning = "close";
          # ^^^ close Steam and apply the changes, waiting for any running games to exit first

          defaultCompatTool = self'.packages.proton-ge-patched;
        };

        systemd.user.services = {
          steam-autostart = {
            Unit = {
              PartOf = [ "graphical-session.target" ];
              After = [ "graphical-session.target" ];
            };

            Install = {
              WantedBy = [ "graphical-session.target" ];
            };

            Service = {
              ExecStart = lib.concatStringsSep " " [
                (lib.getExe osConfig.programs.steam.package)
                "-nochatui"
                "-nofriendsui"
              ];

              Restart = "always";
            };
          };
        };
      };
  };
}
