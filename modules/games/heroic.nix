{
  ...
}:

{
  zen.games.heroic = {
    description = ''
      epic games launcher
      and gog, very good

      in plans make add games to steam
    '';

    homeManager =
      {
        self',
        pkgs,
        lib,
        config,
        user,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
        json = pkgs.formats.json { };
      in
      {
        home.packages = [
          pkgs.heroic
        ];

        xdg.configFile = lib.mkMerge [
          # heroic
          {
            "heroic/config.json".source = json.generate "heroic-config.json" {
              userHome = config.home.homeDirectory;
              defaultSettings = {
                enviromentOptions = [ ];
                wrapperOptions = [ ];

                analyticsOptIn = false;
                checkUpdatesInterval = 0;
                enableUpdates = false;
                hideChangelogsOnStartup = true;

                addDesktopShortcuts = false;
                addStartMenuShortcuts = false;
                libraryTopSection = "recently_played";

                autoInstallDxvk = true;
                autoInstallVkd3d = true;
                autoInstallDxvkNvapi = true;

                addSteamShortcuts = false;
                preferSystemLibs = true;
                checkForUpdatesOnStartup = true;
                autoUpdateGames = false;

                defaultInstallPath = "${config.xdg.userDirs.publicShare}/Games";
                defaultSteamPath = "${config.home.homeDirectory}/.steam/steam";
                defaultWinePrefix = "${config.xdg.userDirs.publicShare}/wine-prefix";

                language = "en";
                maxWorkers = 0;
                minimizeOnLaunch = false;
                nvidiaPrime = false;
                showFps = false;
                useGameMode = false;

                customWinePaths = [
                  # "/path/to/dir/wine"
                ];

                wineCrossoverBottle = "Heroic";
                winePrefix = "${config.xdg.userDirs.publicShare}/wine-prefix";
                wineVersion = {
                  bin = "${self'.legacyPackages.proton.ge-patched.steamcompattool}/proton";
                  name = "GE-Proton";
                  type = "proton";
                };

                battlEyeRuntime = true;
                disableUMU = false;
                eacRuntime = true;
                enableEsync = true;
                enableFsync = true;
                enableHDR = false;
                enableMsync = false;
                enableWineWayland = false;
                enableWoW64 = true;

                beforeLaunchScriptPath = "";
                afterLaunchScriptPath = "";

                framelessWindow = false;
                verboseLogs = true;
                downloadProtonToSteam = false;
                advertiseAvxForRosetta = false;

                noTrayIcon = false;
                showValveProton = false;

                disableSmoothScrolling = true;
                customThemesPath = "${config.xdg.configHome}/heroic/themes";
                theme = "stylix.css";

                exitToTray = true;
                darkTrayIcon = false;
                discordRPC = true;
                maxRecentGames = 5;

                contentFontFamily = config.stylix.fonts.sansSerif.name;
                actionsFontFamily = config.stylix.fonts.sansSerif.name;
                allTilesInColor = true;
                titlesAlwaysVisible = true;
              };
            };

            "heroic/themes/stylix.css".text =
              # css
              ''
                body.stylix {
                  --accent: ${colors.base09};
                  --accent-overlay: var(--accent);

                  --action-icon-active: var(--accent);
                  --action-icon-hover: var(--text-default);
                  --action-icon: var(--navbar-accent);
                  
                  --anticheat-broken: ${colors.base0A};
                  --anticheat-denied: var(--danger);
                  --anticheat-planned: ${colors.base0E};
                  --anticheat-running: var(--text-default);
                  --anticheat-supported: ${colors.base0B};
                  
                  --background: ${colors.base00};
                  --background-darker: ${colors.base01};
                  --background-secondary: ${colors.base01};
                  --background-lighter: ${colors.base02};

                  --danger: ${colors.base0F};
                  --danger-hover: ${colors.base08};

                  --icon-disabled: ${colors.base04};
                  --icons-background: var(--background-lighter);

                  --modal-background: var(--body-background);
                  --modal-border: var(--body-background);

                  --navbar-accent: ${colors.base04};
                  --navbar-active-background: ${colors.base01};
                  --navbar-active: var(--accent);
                  --navbar-background: var(--background);

                  --neutral-06: var(--text-default);

                  --primary: ${colors.base08};
                  --primary-hover: ${colors.base09};

                  --success: ${colors.base0C};
                  --success-hover: ${colors.base0B};

                  --text-default: ${colors.base05};
                  --text-secondary: var(--text-default);
                  --text-tertiary: var(--background);
                  --text-title: var(--text-default);

                  --body-background: var(--background-darker);
                  --cancel-button: ${colors.base08};
                  --current-background: var(--body-background);
                  --input-background: var(--background);
                }
              '';

            "heroic/themes/stylix.json".source = json.generate "heroic-stylix.json" {
              name = "Stylix-${config.stylix.polarity}";
              filename = "stylix.css";
              author = "${user.userName}";
            };
          }
        ];
      };
  };
}
