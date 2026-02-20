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
    ConfigVersion = 2;
  };

  GUI = {
    ApplicationTheme = "classic";
    ColorPasswords = true;
    CompactMode = true;
    HideGroupsPanel = true;
    HidePasswords = true;
    HidePreviewPanel = true;
    HideToolbar = true;
    MinimizeOnClose = true;
    MinimizeToTray = true;
    MonospaceNotes = true;
    ShowTrayIcon = true;
    TrayIconAppearance = "monochrome-dark";
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
    ClearClipboardTimeout = 24;
    ClearSearch = false;
    IconDownloadFallback = true;
    LockDatabaseIdle = true;
    LockDatabaseScreenLock = false;
    Security_HideNotes = true;
  };

  FdoSecrets = {
    Enabled = true;
  };
}
