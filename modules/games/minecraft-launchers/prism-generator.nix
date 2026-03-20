{
  pkgs,
  lib,
  config,

  package ? throw "Set the package",
  persistDir ? toString null,
  configDir ? "${package.name}/${package.name}.cfg",
  ...
}:

{
  persist.user.directories = [ persistDir ];

  networking.firewall = lib.genAttrs [
    "allowedTCPPorts"
    "allowedUDPPorts"
  ] (_n: [ 25565 ]);

  hmPackages = [ package ];

  hm.xdg.dataFile = {
    ${configDir}.source = lib.mkIf (configDir != null) (
      (pkgs.formats.ini { }).generate "${package.name}-settings" {
        General = {
          ApplicationTheme = "system";
          AutoCloseConsole = false;
          AutomaticJavaDownload = false;
          AutomaticJavaSwitch = false;
          CatOpacity = 100;
          CentralModsDir = "mods";
          CloseAfterLaunch = false;
          ConfigVersion = "1.2";
          ConsoleFont = config.stylix.fonts.sansSerif.name;
          ConsoleFontSize = config.stylix.fonts.sizes.terminal;
          ConsoleOverflowStop = true;
          DownloadsDir = config.hm.xdg.userDirs.download;
          DownloadsDirWatchRecursive = false;
          EnableFeralGamemode = config.programs.gamemode.enable;
          EnableMangoHud = config.hm.programs.mangohud.enable;
          IconTheme =
            if config.stylix.polarity == "dark" then
              "pe_light"
            else if config.stylix.polarity == "light" then
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
          Language = lib.head (lib.split "\\." config.i18n.defaultLocale);
          LastHostname = lib.configurationName;
          LaunchMaximized = false;
          MaxMemAlloc =
            let
              int = 1024;
            in
            if (lib.configurationName == "pcRyazenka") then (int * 12) else (int * 8);
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
          MainWindowState = "@ByteArray(AAAA/wAAAAD9AAAAAAAAAssAAAQCAAAABAAAAAQAAAAIAAAACPwAAAADAAAAAAAAAAEAAAAeAGkAbgBzAHQAYQBuAGMAZQBUAG8AbwBsAEIAYQByAwAAAAD/////AAAAAAAAAAAAAAACAAAAAQAAABYAbQBhAGkAbgBUAG8AbwBsAEIAYQByAAAAAAD/////AAAAAAAAAAAAAAADAAAAAQAAABYAbgBlAHcAcwBUAG8AbwBsAEIAYQByAAAAAAD/////AAAAAAAAAAA=)";
        };
      }
    );
  };
}
