{
  lib,
  config,
  ...
}:

{
  runUserMatugenTemplates = false;
  widgetBackgroundColor = "sch";
  widgetColorMode = "default";
  controlCenterTileColorMode = "primary";
  buttonColorMode = "primary";
  cornerRadius = 12;
  niriLayoutGapsOverride = -1;
  niriLayoutRadiusOverride = -1;
  niriLayoutBorderSize = -1;
  hyprlandLayoutGapsOverride = -1;
  hyprlandLayoutRadiusOverride = -1;
  hyprlandLayoutBorderSize = -1;
  mangoLayoutGapsOverride = -1;
  mangoLayoutRadiusOverride = -1;
  mangoLayoutBorderSize = -1;
  firstDayOfWeek = -1;
  use24HourClock = true;
  showSeconds = false;
  padHours12Hour = false;
  useFahrenheit = false;
  windSpeedUnit = "ms";
  nightModeEnabled = false;
  animationSpeed = 2;
  customAnimationDuration = 500;
  syncComponentAnimationSpeeds = false;
  popoutAnimationSpeed = 2;
  popoutCustomAnimationDuration = 150;
  modalAnimationSpeed = 2;
  modalCustomAnimationDuration = 150;
  enableRippleEffects = true;
  m3ElevationEnabled = true;
  m3ElevationIntensity = 18;
  m3ElevationOpacity = 30;
  m3ElevationColorMode = "default";
  m3ElevationLightDirection = "top";
  m3ElevationCustomColor = "#000000";
  modalElevationEnabled = true;
  popoutElevationEnabled = true;
  barElevationEnabled = true;
  wallpaperFillMode = "Fill";
  blurredWallpaperLayer = false;
  blurWallpaperOnOverview = true;

  showLauncherButton = true;
  showWorkspaceSwitcher = true;
  showFocusedWindow = true;
  showWeather = true;
  showMusic = true;
  showClipboard = true;
  showCpuUsage = true;
  showMemUsage = true;
  showCpuTemp = true;
  showGpuTemp = true;
  showSystemTray = true;
  showClock = true;
  showNotificationButton = true;
  showBattery = true;
  showControlCenterButton = true;
  showCapsLockIndicator = true;

  controlCenterShowNetworkIcon = true;
  controlCenterShowBluetoothIcon = true;
  controlCenterShowAudioIcon = true;
  controlCenterShowAudioPercent = false;
  controlCenterShowVpnIcon = true;
  controlCenterShowBrightnessIcon = false;
  controlCenterShowBrightnessPercent = false;
  controlCenterShowMicIcon = false;
  controlCenterShowMicPercent = true;
  controlCenterShowBatteryIcon = false;
  controlCenterShowPrinterIcon = false;
  controlCenterShowScreenSharingIcon = true;

  showPrivacyButton = true;
  privacyShowMicIcon = false;
  privacyShowCameraIcon = false;
  privacyShowScreenShareIcon = false;

  controlCenterWidgets = lib.mkMerge [
    (map
      (id: {
        inherit id;
        enabled = true;
        width = 50;
      })
      [
        "volumeSlider"
        "brightnessSlider"
        "wifi"
        "bluetooth"
        "audioOutput"
        "audioInput"
      ]
    )
    [
      {
        id = "doNotDisturb";
        enabled = true;
        width = 100;
      }
    ]
  ];

  showWorkspaceIndex = false;
  showWorkspaceName = false;
  showWorkspacePadding = false;
  workspaceScrolling = false;
  showWorkspaceApps = false;
  workspaceDragReorder = true;
  maxWorkspaceIcons = 3;
  workspaceAppIconSizeOffset = 0;
  groupWorkspaceApps = true;
  workspaceFollowFocus = false;
  showOccupiedWorkspacesOnly = false;
  reverseScrolling = false;
  dwlShowAllTags = false;

  workspaceActiveAppHighlightEnabled = false;
  workspaceColorMode = "default";
  workspaceOccupiedColorMode = "sec";
  workspaceUnfocusedColorMode = "default";
  workspaceUrgentColorMode = "default";
  workspaceFocusedBorderEnabled = false;
  workspaceFocusedBorderColor = "primary";
  workspaceFocusedBorderThickness = 2;
  workspaceNameIcons = { };
  waveProgressEnabled = true;
  scrollTitleEnabled = true;
  audioVisualizerEnabled = true;
  audioScrollMode = "volume";
  audioWheelScrollAmount = 5;
  clockCompactMode = false;
  focusedWindowCompactMode = false;
  runningAppsCompactMode = true;
  barMaxVisibleApps = 0;
  barMaxVisibleRunningApps = 0;
  barShowOverflowBadge = true;

  appsDockHideIndicators = false;
  appsDockColorizeActive = false;
  appsDockActiveColorMode = "primary";
  appsDockEnlargeOnHover = false;
  appsDockEnlargePercentage = 125;
  appsDockIconSizePercentage = 100;

  keyboardLayoutNameCompactMode = false;
  runningAppsCurrentWorkspace = true;
  runningAppsGroupByApp = false;
  runningAppsCurrentMonitor = false;
  appIdSubstitutions = [ ];
  centeringMode = "index";
  clockDateFormat = "yyyy-MM-dd";
  lockDateFormat = "";
  greeterRememberLastSession = true;
  greeterRememberLastUser = true;
  greeterEnableFprint = false;
  greeterEnableU2f = false;
  greeterWallpaperPath = "";
  greeterUse24HourClock = true;
  greeterShowSeconds = false;
  greeterPadHours12Hour = false;
  greeterLockDateFormat = "";
  greeterWallpaperFillMode = "";
  mediaSize = 1;

  appLauncherViewMode = "list";
  spotlightModalViewMode = "list";
  browserPickerViewMode = "grid";

  browserUsageHistory = { };
  appPickerViewMode = "grid";
  filePickerUsageHistory = { };
  sortAppsAlphabetically = false;
  appLauncherGridColumns = 4;
  spotlightCloseNiriOverview = true;
  spotlightSectionViewModes = { };
  appDrawerSectionViewModes.apps = "list";
  niriOverviewOverlayEnabled = true;
  dankLauncherV2Size = "compact";
  dankLauncherV2BorderEnabled = false;
  dankLauncherV2BorderThickness = 2;
  dankLauncherV2BorderColor = "secondary";
  dankLauncherV2ShowFooter = false;
  dankLauncherV2UnloadOnClose = false;
  useAutoLocation = false;
  weatherEnabled = false;
  networkPreference = "auto";

  iconTheme =
    if (config.stylix.polarity == "light") then
      config.stylix.icons.light
    else if (config.stylix.polarity == "dark") then
      config.stylix.icons.dark
    else
      "System Default";

  cursorSettings = {
    theme = config.stylix.cursor.name;
    size = config.stylix.cursor.size;
  };

  launcherLogoMode = "os";
  launcherLogoColorOverride = "surface";
  launcherLogoColorInvertOnMode = false;
  launcherLogoBrightness = 0.5;
  launcherLogoContrast = 1;
  launcherLogoSizeOffset = 0;
  fontWeight = 400;
  fontScale = 1;
  notepadUseMonospace = true;
  notepadFontFamily = "";
  notepadFontSize = 14;
  notepadShowLineNumbers = false;
  notepadTransparencyOverride = -1;
  notepadLastCustomTransparency = 0.7;
  soundsEnabled = true;
  useSystemSoundTheme = false;
  soundNewNotification = true;
  soundVolumeChanged = true;
  soundPluggedIn = true;
  acMonitorTimeout = 0;
  acLockTimeout = 0;
  acSuspendTimeout = 0;
  acSuspendBehavior = 0;
  acProfileName = "";
  batteryMonitorTimeout = 0;
  batteryLockTimeout = 0;
  batterySuspendTimeout = 0;
  batterySuspendBehavior = 0;
  batteryProfileName = "";
  batteryChargeLimit = 100;
  lockBeforeSuspend = true;
  loginctlLockIntegration = true;
  fadeToLockEnabled = true;
  fadeToLockGracePeriod = 5;
  fadeToDpmsEnabled = true;
  fadeToDpmsGracePeriod = 5;
  launchPrefix = "";
  brightnessDevicePins = { };
  wifiNetworkPins = { };
  bluetoothDevicePins = { };
  audioInputDevicePins = { };
  audioOutputDevicePins = { };
  gtkThemingEnabled = false;
  qtThemingEnabled = false;
  syncModeWithPortal = true;
  terminalsAlwaysDark = false;
  runDmsMatugenTemplates = true;
  showDock = true;
  dockAutoHide = true;
  dockSmartAutoHide = false;
  dockGroupByApp = false;
  dockRestoreSpecialWorkspaceOnClick = false;
  dockOpenOnOverview = false;
  dockPosition = 3;
  dockSpacing = 10;
  dockBottomGap = 0;
  dockMargin = 5;
  dockIconSize = 38;
  dockIndicatorStyle = "line";
  dockBorderEnabled = false;
  dockBorderColor = "surfaceText";
  dockBorderOpacity = 1;
  dockBorderThickness = 1;
  dockIsolateDisplays = true;
  dockLauncherEnabled = true;
  dockLauncherLogoMode = "os";
  dockLauncherLogoCustomPath = "";
  dockLauncherLogoColorOverride = "surface";
  dockLauncherLogoSizeOffset = 0;
  dockLauncherLogoBrightness = 0.5;
  dockLauncherLogoContrast = 1;
  dockMaxVisibleApps = 0;
  dockMaxVisibleRunningApps = 0;
  dockShowOverflowBadge = true;

  modalDarkenBackground = true;

  lockScreenShowPowerActions = true;
  lockScreenShowSystemIcons = true;
  lockScreenShowTime = true;
  lockScreenShowDate = true;
  lockScreenShowProfileImage = false;
  lockScreenShowPasswordField = false;
  lockScreenShowMediaPlayer = true;
  lockScreenPowerOffMonitorsOnLock = false;
  lockAtStartup = false;

  enableFprint = false;
  maxFprintTries = 15;
  enableU2f = false;
  u2fMode = "or";

  lockScreenActiveMonitor = "all";
  lockScreenInactiveColor = "#000000";
  lockScreenNotificationMode = 1;
  lockScreenVideoEnabled = false;
  lockScreenVideoPath = "";
  lockScreenVideoCycling = false;
  hideBrightnessSlider = false;

  notificationOverlayEnabled = true;
  notificationPopupShadowEnabled = true;
  notificationPopupPrivacyMode = false;
  notificationTimeoutLow = 3000;
  notificationTimeoutNormal = 5000;
  notificationTimeoutCritical = 0;
  notificationCompactMode = true;
  notificationPopupPosition = 0;
  notificationAnimationSpeed = 1;
  notificationCustomAnimationDuration = 400;
  notificationHistoryEnabled = true;
  notificationHistoryMaxCount = 50;
  notificationHistoryMaxAgeDays = 7;
  notificationHistorySaveLow = true;
  notificationHistorySaveNormal = true;
  notificationHistorySaveCritical = true;
  notificationRules = [ ];
  notificationFocusedMonitor = false;

  osdAlwaysShowValue = true;
  osdPosition = 2;
  osdVolumeEnabled = true;
  osdMediaVolumeEnabled = true;
  osdMediaPlaybackEnabled = true;
  osdBrightnessEnabled = true;
  osdIdleInhibitorEnabled = true;
  osdMicMuteEnabled = true;
  osdCapsLockEnabled = true;
  osdPowerProfileEnabled = true;
  osdAudioOutputEnabled = true;

  powerActionConfirm = true;
  powerActionHoldDuration = 0.5;
  powerMenuActions = [
    "reboot"
    "logout"
    "poweroff"
    "lock"
    "suspend"
    "restart"
  ];
  powerMenuDefaultAction = "logout";
  powerMenuGridLayout = false;

  # WARN:
  # needs to edit?
  #
  # customPowerActionLock = "";
  # customPowerActionLogout = "";
  # customPowerActionSuspend = "";
  # customPowerActionHibernate = "";
  # customPowerActionReboot = "";
  # customPowerActionPowerOff = "";

  updaterHideWidget = false;
  updaterUseCustomCommand = false;
  updaterCustomCommand = "";
  updaterTerminalAdditionalParams = "";

  displayNameMode = "model";
  screenPreferences = { };
  showOnLastDisplay = { };
  niriOutputSettings = { };
  hyprlandOutputSettings = { };
  displayProfiles = { };
  activeDisplayProfile = { };

  displayProfileAutoSelect = false;
  displayShowDisconnected = false;
  displaySnapToEdge = true;

  barConfigs =
    let
      mkWidgets = map (id: {
        inherit id;
        enabled = true;
      });
    in
    [
      {
        id = "default";
        name = "Main Bar";
        enabled = true;
        position = 2; # left
        screenPreferences = [ "all" ];
        showOnLastDisplay = true;

        leftWidgets = mkWidgets [
          "notificationButton"
          "clock"
          "music"
        ];

        centerWidgets = mkWidgets [
          "workspaceSwitcher"
        ];

        rightWidgets = lib.mkMerge [
          (mkWidgets [
            "systemTray"
          ])
          [
            {
              id = "controlCenterButton";
              enabled = true;
              showAudioIcon = true;
              showAudioPercent = false;
              showBatteryIcon = true;
              showBrightnessIcon = true;
              showBrightnessPercent = true;
              showMicIcon = true;
              showMicPercent = false;
              showPrinterIcon = true;
            }
          ]
          (mkWidgets [
            "powerMenuButton"
          ])
        ];

        spacing = 0;
        innerPadding = 10;
        bottomGap = 0;
        transparency = 1;
        widgetTransparency = 1;
        squareCorners = true;
        noBackground = false;
        maximizeWidgetIcons = false;
        maximizeWidgetText = false;
        removeWidgetPadding = false;
        widgetPadding = 8;
        gothCornersEnabled = false;
        gothCornerRadiusOverride = false;
        gothCornerRadiusValue = 12;
        borderEnabled = true;
        borderColor = "secondary";
        borderOpacity = 1;
        borderThickness = 2;
        widgetOutlineEnabled = false;
        widgetOutlineColor = "primary";
        widgetOutlineOpacity = 1;
        widgetOutlineThickness = 1;
        fontScale = 1;
        iconScale = 1;
        autoHide = false;
        autoHideDelay = 250;
        showOnWindowsOpen = false;
        openOnOverview = false;
        visible = true;
        popupGapsAuto = true;
        popupGapsManual = 4;
        maximizeDetection = true;
        scrollEnabled = true;
        scrollXBehavior = "column";
        scrollYBehavior = "workspace";
        shadowIntensity = 0;
        # left       shadowOpacity = 60;
        shadowColorMode = "default";
        shadowCustomColor = "#000000";
        clickThrough = false;
      }
    ];

  desktopClockEnabled = false;
  desktopClockStyle = "analog";
  desktopClockTransparency = 0.8;
  desktopClockColorMode = "primary";
  desktopClockShowDate = true;
  desktopClockShowAnalogNumbers = false;
  desktopClockShowAnalogSeconds = true;
  desktopClockX = -1;
  desktopClockY = -1;
  desktopClockWidth = 280;
  desktopClockHeight = 180;
  desktopClockDisplayPreferences = [ "all" ];

  systemMonitorEnabled = false;
  systemMonitorShowHeader = true;
  systemMonitorTransparency = 0.8;
  systemMonitorColorMode = "primary";

  desktopWidgetPositions = { };
  desktopWidgetGridSettings = { };
  desktopWidgetInstances = [ ];
  desktopWidgetGroups = [ ];

  builtInPluginSettings = {
    dms_settings_search = {
      trigger = "?";
      enabled = false;
    };
    dms_sysmon = {
      enabled = false;
    };
    dms_notepad = {
      enabled = false;
    };
    dms_settings = {
      enabled = false;
    };
  };

  clipboardEnterToPaste = false;
  launcherPluginVisibility = { };
  launcherPluginOrder = [ ];

  configVersion = 6;
}
