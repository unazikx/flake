{
  ...
}:

{
  zen.programs.gui.firefox.policies = {
    homeManager =
      {
        ...
      }:
      {
        programs.firefox = {
          policies = {
            # keep-sorted start block=yes
            AppAutoUpdate = false;
            AutofillAddressEnabled = false;
            AutofillCreditCardEnabled = false;
            BackgroundAppUpdate = false;
            DisableAppUpdate = true;
            DisableFirefoxScreenshots = true;
            DisableFirefoxStudies = true;
            DisableFormHistory = true;
            DisableMasterPasswordCreation = true;
            DisablePasswordReveal = true;
            DisablePocket = true;
            DisableProfileRefresh = true;
            DisableSetDesktopBackground = true;
            DisableTelemetry = true;
            DisplayBookmarksToolbar = false;
            DisplayMenuBar = "never";
            DontCheckDefaultBrowser = true;
            EnableTrackingProtection = {
              Value = true;
              Locked = true;
              Cryptomining = true;
              Fingerprinting = false; # true -> force light theme
              EmailTracking = true;
            };
            ExtensionSettings = {
              "*" = {
                default_area = "menupanel";
                installation_mode = "allowed";
              };
            };
            FirefoxHome = {
              Pocket = false;
              Snippets = false;
            };
            GenerativeAI = {
              Enabled = false;
              Chatbot = false;
              LinkPreviews = false;
              TabGroups = false;
              Locked = false;
            };
            HardwareAcceleration = true;
            ManualAppUpdateOnly = true;
            NetworkPrediction = false;
            OfferToSaveLogins = false;
            OfferToSaveLoginsDefault = false;
            PDFjs.Enabled = false;
            PasswordManagerEnabled = false;
            PictureInPicture.Enabled = true;
            PrimaryPassword = false;
            PromptForDownloadLocation = false;
            SanitizeOnShutdown = {
              Cache = true;
              Cookies = false;
              Downloads = false;
              FormData = true;
              History = false;
              OfflineApps = true;
              Sessions = false;
            };
            # keep-sorted end
          };
        };
      };
  };
}
