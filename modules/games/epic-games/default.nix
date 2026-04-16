# INFO:
# egs cli instller
#
# > legendary auth
# > legendary list
# > legendary install

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
          json = pkgs.formats.json { };
        in
        {
          persist.user.directories = [ ".config/heroic" ];

          hmPackages = [ pkgs.heroic ];

          hm.xdg.configFile = lib.mkMerge [
            # heroic
            (with config.lib.stylix.colors.withHashtag; {
              "heroic/config.json".source = json.generate "heroic-config.json" {
                userHome = config.hm.home.homeDirectory;
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

                  defaultInstallPath = "${config.hm.xdg.userDirs.publicShare}/Games";
                  defaultSteamPath = "${config.hm.home.homeDirectory}/.steam/steam";
                  defaultWinePrefix = "${config.hm.xdg.userDirs.publicShare}/wine-prefix";

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
                  winePrefix = "${config.hm.xdg.userDirs.publicShare}/wine-prefix";
                  wineVersion = {
                    bin = "${pkgs.proton-ge-bin.steamcompattool}/proton";
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
                  customThemesPath = "${config.hm.xdg.configHome}/heroic/themes";
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
                    --accent: ${base09};
                    --accent-overlay: var(--accent);

                    --action-icon-active: var(--accent);
                    --action-icon-hover: var(--text-default);
                    --action-icon: var(--navbar-accent);
                    
                    --anticheat-broken: ${base0A};
                    --anticheat-denied: var(--danger);
                    --anticheat-planned: ${base0E};
                    --anticheat-running: var(--text-default);
                    --anticheat-supported: ${base0B};
                    
                    --background: ${base00};
                    --background-darker: ${base01};
                    --background-secondary: ${base01};
                    --background-lighter: ${base02};

                    --danger: ${base0F};
                    --danger-hover: ${base08};

                    --icon-disabled: ${base04};
                    --icons-background: var(--background-lighter);

                    --modal-background: var(--body-background);
                    --modal-border: var(--body-background);

                    --navbar-accent: ${base04};
                    --navbar-active-background: ${base01};
                    --navbar-active: var(--accent);
                    --navbar-background: var(--background);

                    --neutral-06: var(--text-default);

                    --primary: ${base08};
                    --primary-hover: ${base09};

                    --success: ${base0C};
                    --success-hover: ${base0B};

                    --text-default: ${base05};
                    --text-secondary: var(--text-default);
                    --text-tertiary: var(--background);
                    --text-title: var(--text-default);

                    --body-background: var(--background-darker);
                    --cancel-button: ${base08};
                    --current-background: var(--body-background);
                    --input-background: var(--background);
                  }
                '';

              "heroic/themes/stylix.json".source = json.generate "heroic-stylix.json" {
                name = "Stylix-${config.stylix.polarity}";
                filename = "stylix.css";
                author = "${lib.userName}";
              };
            })
          ];
        };
    };
}
