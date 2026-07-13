{
  ...
}:

{
  zen.programs.desktop.dank-material-shell.settings = {
    homeManager =
      {
        lib,
        config,
        ...
      }:
      {
        programs.dank-material-shell = {
          settings = {
            # keep-sorted start block=yes

            # WARN:
            # needs to edit?
            #
            # customPowerActionLock = "";
            # customPowerActionLogout = "";
            # customPowerActionSuspend = "";
            # customPowerActionHibernate = "";
            # customPowerActionReboot = "";
            # customPowerActionPowerOff = "";

            acLockTimeout = 0;
            acMonitorTimeout = 0;
            acProfileName = "";
            acSuspendBehavior = 0;
            acSuspendTimeout = 0;
            activeDisplayProfile = { };
            animationSpeed = 2;
            appDrawerSectionViewModes.apps = "list";
            appIdSubstitutions = [ ];
            appLauncherGridColumns = 4;
            appLauncherViewMode = "list";
            appPickerViewMode = "grid";
            appsDockActiveColorMode = "primary";
            appsDockColorizeActive = false;
            appsDockEnlargeOnHover = false;
            appsDockEnlargePercentage = 125;
            appsDockHideIndicators = false;
            appsDockIconSizePercentage = 100;
            audioInputDevicePins = { };
            audioOutputDevicePins = { };
            audioScrollMode = "volume";
            audioVisualizerEnabled = true;
            audioWheelScrollAmount = 5;
            barConfigs = [
              {
                id = "default";
                name = "Main Bar";
                enabled = true;
                position = 2; # left
                screenPreferences = [ "all" ];
                showOnLastDisplay = true;

                leftWidgets = [
                  {
                    id = "notificationButton";
                    enabled = true;
                  }
                  {
                    id = "clock";
                    enabled = true;
                  }
                  {
                    id = "music";
                    enabled = true;
                  }
                ];

                centerWidgets = [
                  {
                    id = "workspaceSwitcher";
                    enabled = true;
                  }
                ];

                rightWidgets = [
                  {
                    id = "keyboard_layout_name";
                    enabled = true;
                  }
                  {
                    id = "systemTray";
                    enabled = true;
                  }
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
                  {
                    id = "powerMenuButton";
                    enabled = true;
                  }
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
            barElevationEnabled = true;
            barMaxVisibleApps = 0;
            barMaxVisibleRunningApps = 0;
            barShowOverflowBadge = true;
            batteryChargeLimit = 100;
            batteryLockTimeout = 0;
            batteryMonitorTimeout = 0;
            batteryProfileName = "";
            batterySuspendBehavior = 0;
            batterySuspendTimeout = 0;
            bluetoothDevicePins = { };
            blurWallpaperOnOverview = true;
            blurredWallpaperLayer = false;
            brightnessDevicePins = { };
            browserPickerViewMode = "grid";
            browserUsageHistory = { };
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
            buttonColorMode = "primary";
            centeringMode = "index";
            clipboardEnterToPaste = false;
            clockCompactMode = false;
            clockDateFormat = "yyyy-MM-dd";
            configVersion = 6;
            controlCenterShowAudioIcon = true;
            controlCenterShowAudioPercent = false;
            controlCenterShowBatteryIcon = false;
            controlCenterShowBluetoothIcon = true;
            controlCenterShowBrightnessIcon = false;
            controlCenterShowBrightnessPercent = false;
            controlCenterShowMicIcon = false;
            controlCenterShowMicPercent = true;
            controlCenterShowNetworkIcon = false;
            controlCenterShowPrinterIcon = false;
            controlCenterShowScreenSharingIcon = false;
            controlCenterShowVpnIcon = false;
            controlCenterTileColorMode = "primary";
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
              (map
                (id: {
                  inherit id;
                  enabled = true;
                  width = 25;
                })
                [
                  "nightMode"
                  "idleInhibitor"
                  "doNotDisturb"
                  "battery"
                ]
              )
            ];
            cornerRadius = 12;
            cursorSettings = {
              theme = config.stylix.cursor.name;
              size = config.stylix.cursor.size;
            };
            customAnimationDuration = 500;
            dankLauncherV2BorderColor = "secondary";
            dankLauncherV2BorderEnabled = false;
            dankLauncherV2BorderThickness = 2;
            dankLauncherV2ShowFooter = false;
            dankLauncherV2Size = "compact";
            dankLauncherV2UnloadOnClose = false;
            desktopClockColorMode = "primary";
            desktopClockDisplayPreferences = [ "all" ];
            desktopClockEnabled = false;
            desktopClockHeight = 180;
            desktopClockShowAnalogNumbers = false;
            desktopClockShowAnalogSeconds = true;
            desktopClockShowDate = true;
            desktopClockStyle = "analog";
            desktopClockTransparency = 0.8;
            desktopClockWidth = 280;
            desktopClockX = -1;
            desktopClockY = -1;
            desktopWidgetGridSettings = { };
            desktopWidgetGroups = [ ];
            desktopWidgetInstances = [ ];
            desktopWidgetPositions = { };
            displayNameMode = "model";
            displayProfileAutoSelect = false;
            displayProfiles = { };
            displayShowDisconnected = false;
            displaySnapToEdge = true;
            dockAutoHide = true;
            dockBorderColor = "surfaceText";
            dockBorderEnabled = false;
            dockBorderOpacity = 1;
            dockBorderThickness = 1;
            dockBottomGap = 0;
            dockGroupByApp = false;
            dockIconSize = 38;
            dockIndicatorStyle = "line";
            dockIsolateDisplays = true;
            dockLauncherEnabled = true;
            dockLauncherLogoBrightness = 0.5;
            dockLauncherLogoColorOverride = "surface";
            dockLauncherLogoContrast = 1;
            dockLauncherLogoCustomPath = "";
            dockLauncherLogoMode = "os";
            dockLauncherLogoSizeOffset = 0;
            dockMargin = 5;
            dockMaxVisibleApps = 0;
            dockMaxVisibleRunningApps = 0;
            dockOpenOnOverview = false;
            dockPosition = 3;
            dockRestoreSpecialWorkspaceOnClick = false;
            dockShowOverflowBadge = true;
            dockSmartAutoHide = false;
            dockSpacing = 10;
            dwlShowAllTags = false;
            enableFprint = false;
            enableRippleEffects = true;
            enableU2f = false;
            fadeToDpmsEnabled = true;
            fadeToDpmsGracePeriod = 5;
            fadeToLockEnabled = true;
            fadeToLockGracePeriod = 5;
            filePickerUsageHistory = { };
            firstDayOfWeek = -1;
            focusedWindowCompactMode = false;
            fontScale = 1;
            fontWeight = 400;
            greeterEnableFprint = false;
            greeterEnableU2f = false;
            greeterLockDateFormat = "";
            greeterPadHours12Hour = false;
            greeterRememberLastSession = true;
            greeterRememberLastUser = true;
            greeterShowSeconds = false;
            greeterUse24HourClock = true;
            greeterWallpaperFillMode = "";
            greeterWallpaperPath = "";
            groupWorkspaceApps = true;
            gtkThemingEnabled = false;
            hideBrightnessSlider = false;
            hyprlandLayoutBorderSize = -1;
            hyprlandLayoutGapsOverride = -1;
            hyprlandLayoutRadiusOverride = -1;
            hyprlandOutputSettings = { };
            iconTheme =
              if (config.stylix.polarity == "light") then
                config.stylix.icons.light
              else if (config.stylix.polarity == "dark") then
                config.stylix.icons.dark
              else
                "System Default";
            keyboardLayoutNameCompactMode = false;
            launchPrefix = "";
            launcherLogoBrightness = 0.5;
            launcherLogoColorInvertOnMode = false;
            launcherLogoColorOverride = "surface";
            launcherLogoContrast = 1;
            launcherLogoMode = "os";
            launcherLogoSizeOffset = 0;
            launcherPluginOrder = [ ];
            launcherPluginVisibility = { };
            lockAtStartup = false;
            lockBeforeSuspend = true;
            lockDateFormat = "";
            lockScreenActiveMonitor = "all";
            lockScreenInactiveColor = "#000000";
            lockScreenNotificationMode = 1;
            lockScreenPowerOffMonitorsOnLock = false;
            lockScreenShowDate = true;
            lockScreenShowMediaPlayer = true;
            lockScreenShowPasswordField = false;
            lockScreenShowPowerActions = true;
            lockScreenShowProfileImage = false;
            lockScreenShowSystemIcons = true;
            lockScreenShowTime = true;
            lockScreenVideoCycling = false;
            lockScreenVideoEnabled = false;
            lockScreenVideoPath = "";
            loginctlLockIntegration = true;
            m3ElevationColorMode = "default";
            m3ElevationCustomColor = "#000000";
            m3ElevationEnabled = true;
            m3ElevationIntensity = 18;
            m3ElevationLightDirection = "top";
            m3ElevationOpacity = 30;
            mangoLayoutBorderSize = -1;
            mangoLayoutGapsOverride = -1;
            mangoLayoutRadiusOverride = -1;
            maxFprintTries = 15;
            maxWorkspaceIcons = 3;
            mediaSize = 1;
            modalAnimationSpeed = 2;
            modalCustomAnimationDuration = 150;
            modalDarkenBackground = true;
            modalElevationEnabled = true;
            networkPreference = "auto";
            nightModeEnabled = false;
            niriLayoutBorderSize = -1;
            niriLayoutGapsOverride = -1;
            niriLayoutRadiusOverride = -1;
            niriOutputSettings = { };
            niriOverviewOverlayEnabled = true;
            notepadFontFamily = "";
            notepadFontSize = 14;
            notepadLastCustomTransparency = 0.7;
            notepadShowLineNumbers = false;
            notepadTransparencyOverride = -1;
            notepadUseMonospace = true;
            notificationAnimationSpeed = 1;
            notificationCompactMode = true;
            notificationCustomAnimationDuration = 400;
            notificationFocusedMonitor = false;
            notificationHistoryEnabled = true;
            notificationHistoryMaxAgeDays = 7;
            notificationHistoryMaxCount = 50;
            notificationHistorySaveCritical = true;
            notificationHistorySaveLow = true;
            notificationHistorySaveNormal = true;
            notificationOverlayEnabled = true;
            notificationPopupPosition = 0;
            notificationPopupPrivacyMode = false;
            notificationPopupShadowEnabled = true;
            notificationRules = [ ];
            notificationTimeoutCritical = 0;
            notificationTimeoutLow = 3000;
            notificationTimeoutNormal = 5000;
            osdAlwaysShowValue = true;
            osdAudioOutputEnabled = true;
            osdBrightnessEnabled = true;
            osdCapsLockEnabled = true;
            osdIdleInhibitorEnabled = true;
            osdMediaPlaybackEnabled = true;
            osdMediaVolumeEnabled = true;
            osdMicMuteEnabled = true;
            osdPosition = 4; # top-center
            osdPowerProfileEnabled = true;
            osdVolumeEnabled = true;
            padHours12Hour = false;
            popoutAnimationSpeed = 2;
            popoutCustomAnimationDuration = 150;
            popoutElevationEnabled = true;
            powerActionConfirm = true;
            powerActionHoldDuration = 0.5;
            powerMenuActions = [
              "reboot"
              "logout"
              "poweroff"
              "lock"
              "suspend"
            ];
            powerMenuDefaultAction = "logout";
            powerMenuGridLayout = false;
            privacyShowCameraIcon = false;
            privacyShowMicIcon = false;
            privacyShowScreenShareIcon = false;
            qtThemingEnabled = false;
            reverseScrolling = false;
            runDmsMatugenTemplates = true;
            runUserMatugenTemplates = false;
            runningAppsCompactMode = true;
            runningAppsCurrentMonitor = false;
            runningAppsCurrentWorkspace = true;
            runningAppsGroupByApp = false;
            screenPreferences = { };
            scrollTitleEnabled = true;
            showBattery = true;
            showCapsLockIndicator = true;
            showClipboard = true;
            showClock = true;
            showControlCenterButton = true;
            showCpuTemp = true;
            showCpuUsage = true;
            showDock = true;
            showFocusedWindow = true;
            showGpuTemp = true;
            showLauncherButton = true;
            showMemUsage = true;
            showMusic = true;
            showNotificationButton = true;
            showOccupiedWorkspacesOnly = false;
            showOnLastDisplay = { };
            showPrivacyButton = true;
            showSeconds = false;
            showSystemTray = true;
            showWeather = true;
            showWorkspaceApps = false;
            showWorkspaceIndex = false;
            showWorkspaceName = false;
            showWorkspacePadding = false;
            showWorkspaceSwitcher = true;
            sortAppsAlphabetically = false;
            soundNewNotification = true;
            soundPluggedIn = true;
            soundVolumeChanged = true;
            soundsEnabled = true;
            spotlightCloseNiriOverview = true;
            spotlightModalViewMode = "list";
            spotlightSectionViewModes = { };
            syncComponentAnimationSpeeds = false;
            syncModeWithPortal = true;
            systemMonitorColorMode = "primary";
            systemMonitorEnabled = false;
            systemMonitorShowHeader = true;
            systemMonitorTransparency = 0.8;
            terminalsAlwaysDark = false;
            u2fMode = "or";
            updaterCustomCommand = "";
            updaterHideWidget = false;
            updaterTerminalAdditionalParams = "";
            updaterUseCustomCommand = false;
            use24HourClock = true;
            useAutoLocation = false;
            useFahrenheit = false;
            useSystemSoundTheme = false;
            wallpaperFillMode = "Fill";
            waveProgressEnabled = true;
            weatherEnabled = false;
            widgetBackgroundColor = "sch";
            widgetColorMode = "default";
            wifiNetworkPins = { };
            windSpeedUnit = "ms";
            workspaceActiveAppHighlightEnabled = false;
            workspaceAppIconSizeOffset = 0;
            workspaceColorMode = "default";
            workspaceDragReorder = true;
            workspaceFocusedBorderColor = "primary";
            workspaceFocusedBorderEnabled = false;
            workspaceFocusedBorderThickness = 2;
            workspaceFollowFocus = false;
            workspaceNameIcons = { };
            workspaceOccupiedColorMode = "sec";
            workspaceScrolling = false;
            workspaceUnfocusedColorMode = "default";
            workspaceUrgentColorMode = "default";
            # keep-sorted end
          };

          session =
            let
              minute = 60;
            in
            {
              acMonitorTimeout = minute * 20;
              acLockTimeout = minute * 15;

              nightModeAutoEnabled = true;
              nightModeTemperature = 4500;
              nightModeAutoMode = "location";

              # if nightModeAutoMode = "time";
              nightModeStartHour = 21;
              nightModeStartMinute = 0;
              nightModeEndHour = 6;
              nightModeEndMinute = 0;
            };
        };
      };
  };
}
