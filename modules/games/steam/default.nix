{
  zen,
  ...
}:

{
  flake-file.inputs = {
    steam-config-nix = {
      type = "github";
      owner = "different-name";
      repo = "steam-config-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
  };

  zen.games.steam = {
    description = ''
      for unified prefix use:
      STEAM_COMPAT_DATA_PATH=your_path_withouts_strings_around %command%

      config options:
      https://github.com/different-name/steam-config-nix/blob/master/options.md
    '';

    includes = [
      zen.games.steam.non-steam-games
      zen.games.steam.steam-games
    ];

    nixos =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        hardware.xpadneo.enable = true;

        programs = {
          steam = {
            enable = true;

            extraCompatPackages = [
              pkgs.proton-ge-bin-patched
            ];

            remotePlay.openFirewall = true;

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

          gamemode = {
            enable = true;
            enableRenice = true;
          };
        };

        environment.systemPackages = [
          # WARN:
          # idk it isnt works
          (pkgs.writeShellScriptBin "steamos-session-select" ''
            steam -shutdown
          '')
        ];

        systemd.user.services = {
          steam-autostart = {
            wantedBy = [ "graphical-session.target" ];
            partOf = [ "graphical-session.target" ];
            after = [ "graphical-session.target" ];

            serviceConfig = {
              ExecStart = lib.concatStringsSep " " [
                (lib.getExe config.programs.steam.package)
                "-nochatui"
                "-nofriendsui"
                "-silent"
              ];
              Restart = "always";
              RestartSec = 2;
            };
          };
        };
      };

    homeManagerNixos =
      {
        inputs,
        pkgs,
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

          defaultCompatTool = pkgs.proton-ge-bin-patched;
        };
      };
  };
}
