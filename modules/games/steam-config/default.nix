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
      config options:
      https://github.com/different-name/steam-config-nix/blob/master/options.md
    '';

    includes = [
      zen.games.steam-config.config-files
      zen.games.steam-config.non-steam-games
      zen.games.steam-config.steam-games
    ];

    wiki = {
      "Steam".links = [
        {
          name = "steam-config-nix";
          url = "https://github.com/different-name/steam-config-nix/blob/master/options.md";
          logo = "https://avatars.githubusercontent.com/u/49257026";
        }
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
          displayRatesAsBits = false;
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
