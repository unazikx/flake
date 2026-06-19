# WARN:
# for unified prefix use
# STEAM_COMPAT_DATA_PATH=your_path_withouts_strings_around %command%

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
          persist.user.directories = [
            ".local/share/Steam"
            ".steam"
          ];

          hardware.xpadneo.enable = true;

          programs = {
            steam = {
              enable = true;

              extest.enable = true;
              protontricks.enable = true;
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

              extraCompatPackages = [
                pkgs.proton-ge-bin
                pkgs.dwproton-bin
              ];

              package = pkgs.steam.override {
                # INFO:
                # doenst works with greetd
                # extraArgs = lib.concatStringsSep " " [
                #   "-nochatui"
                #   "-nofriendsui"
                #   "-silent"
                # ];

                extraEnv = {
                  MANGOHUD = config.hm.programs.mangohud.enable;
                  OBS_VKCAPTURE = true;
                  RADV_TEX_ANISO = 16;
                  PROTON_USE_NTSYNC = 1;
                };

                extraPkgs =
                  pkgs: with pkgs; [
                    config.hm.programs.mangohud.package
                  ];

                extraLibraries =
                  pkgs: with pkgs; [
                    SDL
                    SDL2
                    sdl3
                    wayland
                    gtk2
                  ];
              };

              config = import ./games-config.nix {
                inherit pkgs lib config;
              };

              platformOptimizations.enable = true;
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

          networking.firewall =
            lib.genAttrs
              [
                "allowedTCPPorts"
                "allowedUDPPorts"
              ]
              (
                _n:
                (lib.attrValues {
                  mindustry = 6567;
                })
              );
        };
    };
}
