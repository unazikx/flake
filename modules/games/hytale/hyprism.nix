{
  ...
}:

{
  zen.games.hytale.hyprism = {
    description = ''
      enchanced launcher for hytale
      tries to be alike prism-launcher
    '';

    homeManager =
      {
        inputs',
        pkgs,
        config,
        ...
      }:
      {
        programs.hyprism = {
          enable = true;

          package = inputs'.myown.legacyPackages.hyprism;

          java = {
            package = pkgs.temurin-jre-bin-25;
            args = [
              "-XX:+UseG1GC"
              "-Xms2048M"
              "-Xmx8192M"
            ];
          };

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
              DisableNews = false;
              DismissedAnnouncementIds = [ ];
              GameEnvironmentVariables = "";
              GpuPreference = "auto";
              HasCompletedOnboarding = true;
              InstalledLauncherBranch = "release";
              InstanceDirectory = "";
              Language = "en-US";
              LastExportPath = "";
              LaunchAfterDownload = true;
              LauncherBranch = "release";
              MusicEnabled = false;
              Nick = "unazikx";
              OnlineMode = true;
              PreferredMirror = "estrogen";
              SelectedInstanceId = "";
              SelectedVersion = 0;
              ShowAlphaMods = false;
              ShowDiscordAnnouncements = true;
              UseDualAuth = false;
              Version = "2.0.0";
              VersionType = "release";
              # keep-sorted end
            };
        };
      };
  };
}
