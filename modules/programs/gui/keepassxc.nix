{
  ...
}:

{
  zen.programs.gui.keepassxc = {
    description = ''
      local password manager
      very good/goon ahahah
    '';

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.keepassxc;
        ini = pkgs.formats.ini { };
        pwdir = config.xdg.userDirs.publicShare;
      in
      {
        programs.keepassxc = {
          enable = true;

          settings = {
            # keep-sorted start block=yes newline_separated=yes
            Browser = {
              Browser_AllowLocalhostWithPasskeys = true;
              BrowserType = "Firefox";
              Enabled = true;
              UseCustomBrowser = true; # default is firefox
            };

            FdoSecrets.Enabled = true;

            GUI = {
              ApplicationTheme = "classic";
              ColorPasswords = true;
              CompactMode = true;
              HideGroupPanel = true;
              HideGroupsPanel = false;
              HideMenubar = false;
              HidePasswords = true;
              HidePreviewPanel = false;
              HideToolbar = true;
              MinimizeOnClose = true;
              MinimizeToTray = true;
              MonospaceNotes = true;
              ShowTrayIcon = true;
              TrayIconAppearance =
                if (config.stylix.polarity == "dark") then
                  "monochrome-dark"
                else if (config.stylix.polarity == "light") then
                  "monochrome-light"
                else
                  "colorful";
            };

            General = {
              AutoReloadOnChange = true;
              AutoSaveAfterEveryChange = true;
              AutoSaveOnExit = true;
              BackupBeforeSave = true;
              BackupFilePathPattern = "{DB_FILENAME}_old.kdbx";
              ConfigVersion = 2;
            };

            PasswordGenerator = {
              Length = 32;

              AdvancedMode = true;
              Braces = true;
              Dashes = true;
              EASCII = true;
              Logograms = true;
              LowerCase = true;
              Math = true;
              Numbers = true;
              Quotes = true;
              SpecialChars = true;
              UpperCase = true;
            };

            SSHAgent.Enabled = true;

            Security = {
              ClearClipboardTimeout = 12; # sec
              ClearSearch = true;
              IconDownloadFallback = true;
              LockDatabaseIdle = true;
              LockDatabaseIdleSeconds = 60 * 30; # half hour
              LockDatabaseScreenLock = false;
              Security_HideNotes = true;
            };
            # keep-sorted end
          };
        };

        xdg.cacheFile = {
          "keepassxc/keepassxc.ini".source = ini.generate "keepassxc-config.ini" {
            General = {
              LastDir = pwdir;
              LastActiveDatabase = "${pwdir}/keepass/db.kdbx";
              LastDatabases = "${pwdir}/keepass/db.kdbx";
              LastOpenedDatabases = "${pwdir}/keepass/db.kdbx";
            };
          };
        };

        systemd.user.services = {
          keepassxc-autostart = {
            Unit.After = [ "graphical-session.target" ];
            Install.WantedBy = [ "graphical-session.target" ];

            Service = {
              Type = "simple";
              KillMode = "process";

              ExecStart = lib.concatStringsSep " " [
                (lib.getExe cfg.package)
                "--minimized"
              ];

              Restart = "on-failure";
              RestartSec = 5;
            };
          };
        };
      };
  };
}
