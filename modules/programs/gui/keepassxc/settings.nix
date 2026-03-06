{
  config,
  ...
}:

{
  Browser = {
    Browser_AllowLocalhostWithPasskeys = true;
    BrowserType = "Firefox";
    Enabled = true;
    UseCustomBrowser = true; # default is firefox
  };

  General = {
    AutoReloadOnChange = true;
    AutoSaveAfterEveryChange = true;
    AutoSaveOnExit = true;
    BackupBeforeSave = true;
    BackupFilePathPattern = "{DB_FILENAME}_old.kdbx";
    ConfigVersion = 2;
  };

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

  Security = {
    ClearClipboardTimeout = 12; # sec
    ClearSearch = true;
    IconDownloadFallback = true;
    LockDatabaseIdle = true;
    LockDatabaseIdleSeconds = 60 * 30; # half hour
    LockDatabaseScreenLock = false;
    Security_HideNotes = true;
  };

  SSHAgent.Enabled = true;
  FdoSecrets.Enabled = true;
}
