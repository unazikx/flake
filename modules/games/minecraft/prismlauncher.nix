{
  ...
}:

{
  zen.games.minecraft.prismlauncher = {
    description = ''
      best minecraft launcher
      with easy modpacks support

      stylix:
      https://github.com/nix-community/stylix/pull/2335

      remove own when merged
    '';

    os =
      {
        lib,
        ...
      }:
      {
        networking.firewall = lib.genAttrs [
          "allowedTCPPorts"
          "allowedUDPPorts"
        ] (_: [ 25565 ]);
      };

    homeManager =
      {
        pkgs,
        lib,
        config,
        user,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
      in
      {
        programs.prismlauncher = {
          enable = true;

          package = pkgs.prismlauncher.override {
            gamemodeSupport = true;
            controllerSupport = true;
            textToSpeechSupport = false;

            jdks = [
              # its all LTS
              # https://adoptium.net/temurin/releases
              #
              # keep-sorted start
              pkgs.temurin-jre-bin-17
              pkgs.temurin-jre-bin-21
              pkgs.temurin-jre-bin-25
              pkgs.temurin-jre-bin-8
              # keep-sorted end
            ];
          };

          settings = {
            # keep-sorted start block=yes
            ApplicationTheme = "stylix";
            AutoCloseConsole = false;
            AutomaticJavaDownload = false;
            AutomaticJavaSwitch = false;
            CatOpacity = 100;
            CentralModsDir = "mods";
            CloseAfterLaunch = false;
            ConfigVersion = "1.2";
            ConsoleOverflowStop = true;
            DownloadsDir = config.xdg.userDirs.download;
            DownloadsDirWatchRecursive = false;
            EnableMangoHud = config.programs.mangohud.enable;
            IconTheme =
              if (config.stylix.polarity == "dark") then
                "pe_light"
              else if (config.stylix.polarity == "light") then
                "pe_dark"
              else
                null;
            IconsDir = "icons";
            IgnoreJavaCompatibility = false;
            IgnoreJavaWizard = true;
            InstSortMode = "Name";
            InstanceDir = "instances";
            JavaDir = "java";
            JavaPath = lib.getExe pkgs.temurin-jre-bin;
            LastHostname = user.userName;
            LaunchMaximized = false;
            MainWindowState = "@ByteArray(AAAA/wAAAAD9AAAAAAAAAssAAAQCAAAABAAAAAQAAAAIAAAACPwAAAADAAAAAAAAAAEAAAAeAGkAbgBzAHQAYQBuAGMAZQBUAG8AbwBsAEIAYQByAwAAAAD/////AAAAAAAAAAAAAAACAAAAAQAAABYAbQBhAGkAbgBUAG8AbwBsAEIAYQByAAAAAAD/////AAAAAAAAAAAAAAADAAAAAQAAABYAbgBlAHcAcwBUAG8AbwBsAEIAYQByAAAAAAD/////AAAAAAAAAAA=)";
            MenuBarInsteadOfToolBar = true;
            MinMemAlloc = 512;
            ModDependenciesDisabled = false;
            ModMetadataDisabled = false;
            NumberOfConcurrentDownloads = 6;
            NumberOfConcurrentTasks = 10;
            NumberOfManualRetries = 1;
            OnlineFixes = true;
            PastebinType = 3;
            PermGen = 128;
            QuitAfterGameStop = false;
            RecordGameTime = true;
            RequestTimeout = 60;
            ShowConsole = false;
            ShowConsoleOnError = true;
            ShowGameTime = true;
            ShowGameTimeWithoutDays = false;
            ShowGlobalGameTime = true;
            SkinsDir = "skins";
            SkipModpackUpdatePrompt = false;
            StatusBarVisible = false;
            TechnicClientID = "";
            ToolbarsLocked = true;
            UseDiscreteGpu = false;
            UseNativeGLFW = false;
            UseNativeOpenAL = false;
            UseZink = false;
            UserAgentOverride = "";
            UserAskedAboutAutomaticJavaDownload = true;
            # keep-sorted end
          };

          themes.stylix.theme = {
            name = "Stylix";
            widgets = "Fusion";

            colors = {
              AlternateBase = colors.base01;
              Base = colors.base00;
              BrightText = colors.base08;
              Button = colors.base01;
              ButtonText = colors.base05;
              Highlight = colors.base02;
              HighlightedText = colors.base05;
              Link = colors.base0D;
              Text = colors.base05;
              ToolTipBase = colors.base00;
              ToolTipText = colors.base05;
              Window = colors.base00;
              WindowText = colors.base05;
              fadeAmount = 0.5;
              fadeColor = colors.base02;
            };
            logColors = {
              Debug = colors.base0B;
              DebugHighlight = colors.base03;
              Error = colors.base08;
              ErrorHighlight = colors.base03;
              Fatal = colors.base08;
              FatalHighlight = colors.base00;
              Launcher = colors.base0D;
              LauncherHighlight = colors.base03;
              Message = colors.base05;
              MessageHighlight = colors.base02;
              Warning = colors.base0A;
              WarningHighlight = colors.base03;
            };
          };
        };
      };

    homeManagerNixos =
      {
        lib,
        osConfig,
        ...
      }:
      {
        programs.prismlauncher = {
          settings = {
            EnableFeralGamemode = osConfig.programs.gamemode.enable;
            Language = lib.head (lib.split "\\." osConfig.i18n.defaultLocale);
          };
        };
      };
  };
}
