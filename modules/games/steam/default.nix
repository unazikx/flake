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
        let
          cfg = config.programs.steam;
        in
        {
          persist.user.directories = [
            ".local/share/Steam"
            ".steam"
          ];

          hardware.xpadneo.enable = true;

          programs = {
            steam = {
              enable = true;

              gamescopeSession.enable = true;
              protontricks.enable = true;
              remotePlay.openFirewall = true;

              extraCompatPackages = [ pkgs.proton-ge-bin ];

              package = pkgs.steam.override {
                # INFO:
                # doenst works with greetd
                # moved to hyprland
                # extraArgs = concatStringsSep " " [
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

              config = rec {
                enable = true;
                closeSteam = true;

                # WARN:
                # idk how to make it automatically
                defaultCompatTool = "GE-Proton";

                apps =
                  let
                    mkAttrset =
                      options:
                      lib.mapAttrs (
                        _: attrs:
                        lib.mkMerge [
                          options
                          attrs
                        ]
                      );
                  in
                  lib.mkMerge [
                    (mkAttrset
                      {
                        launchOptions = {
                          wrappers = [
                            (lib.getExe pkgs.gamemode)
                          ];
                        };
                      }
                      {
                        duck-game = {
                          # https://www.protondb.com/app/312530#VBbR6m5Ilw
                          compatTool = "proton_8";
                          id = 312530;
                        };

                        city-car-driving = {
                          # soon...
                          compatTool = "proton_8";
                          id = 493490;
                        };
                      }
                    )

                    # default proton tool
                    (mkAttrset
                      {
                        compatTool = defaultCompatTool;
                        launchOptions = {
                          wrappers = [ (lib.getExe pkgs.gamemode) ];
                        };
                      }
                      {
                        terraria = {
                          # soon...
                          id = 105600;
                        };

                        project-zomboid = {
                          # soon...
                          id = 108600;
                        };

                        valheim = {
                          # soon...
                          id = 892970;
                        };

                        lucid-blocks = {
                          # soon...
                          id = 3495730;
                        };
                      }
                    )
                  ];
              };

              platformOptimizations.enable = true;
            };

            gamescope = {
              enable = true;
              capSysNice = true;
            };

            gamemode = {
              enable = true;
              enableRenice = true;
            };
          };

          hm.systemd.user.services.steam = {
            Unit = {
              Description = cfg.package.meta.description;
              After = [ "graphical-session.target" ];
            };

            Service = {
              ExecStart = lib.concatStringsSep " " [
                (lib.getExe cfg.package)
                "-nochatui"
                "-nofriendsui"
                "-silent"
              ];

              Type = "simple";
              KillMode = "process";
              Restart = "on-failure";
              RestartSec = 5;
            };

            Install.WantedBy = [ "graphical-session.target" ];
          };
        };
    };
}
