# INFO:
# enchanced launcher for hytale

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
            ".config/HyPrism"
            ".local/share/HyPrism"
          ];

          hm = {
            imports = [ ./module.nix ];

            programs.hyprism = {
              enable = true;

              settings =
                let
                  colors = config.lib.stylix.colors.withHashtag;
                in
                {
                  # keep-sorted start block=yes
                  AccentColor = colors.base0B;
                  ActiveProfileIndex = 0;
                  AuthDomain = "sessions.hytale.com";
                  BackgroundMode = "bg_28";
                  CloseAfterLaunch = false;
                  CurseForgeKey = null;
                  CustomJavaPath = lib.getExe pkgs.temurin-jre-bin-25;
                  DisableNews = false;
                  DismissedAnnouncementIds = [ ];
                  GameEnvironmentVariables = "";
                  GpuPreference = "auto";
                  HasCompletedOnboarding = true;
                  InstalledLauncherBranch = "release";
                  InstanceDirectory = "";
                  Instances = [
                    {
                      Id = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee";
                      Name = "Release";
                      Branch = "release";
                      Version = 12;
                      IsInstalled = false;
                    }
                  ];
                  JavaArguments = "-XX:+UseG1GC -Xms2048M -Xmx8192M";
                  Language = "en-US";
                  LastExportPath = "";
                  LaunchAfterDownload = true;
                  LauncherBranch = "release";
                  MusicEnabled = false;
                  Nick = "unazikx";
                  OnlineMode = true;
                  PreferredMirror = "estrogen";
                  Profiles = [
                    {
                      CreatedAt = "2026-04-19T10:35:11.086688Z";
                      Id = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee";
                      IsOfficial = true;
                      Name = "unazikx";
                      TotalPlaytime = "00:00:00";
                      UUID = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee";
                    }
                  ];
                  SelectedInstanceId = "";
                  SelectedVersion = 0;
                  ShowAlphaMods = false;
                  ShowDiscordAnnouncements = true;
                  UUID = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee";
                  UseCustomJava = true;
                  UseDualAuth = false;
                  Version = "2.0.0";
                  VersionType = "release";
                  # keep-sorted end
                };
            };
          };
        };
    };
}
