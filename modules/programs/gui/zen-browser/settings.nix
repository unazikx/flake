{
  lib,
  config,
  ...
}:

let
  inherit (config.services)
    glance
    ;
in

{
  profiles = {
    # keep-sorted start block=yes

    "app.normandy.first_run" = false;
    "browser.display.use_system_colors" = true;
    "browser.ml.linkPreview.collapsed" = true;
    "browser.ml.linkPreview.enabled" = true;
    "browser.ml.linkPreview.shift" = true;
    "browser.startup.homepage" =
      if glance.enable then
        (lib.concatStringsSep ":" [
          glance.settings.server.host
          (toString glance.settings.server.port)
        ])
      else
        "about:home";
    "browser.tabs.groups.enabled" = false;
    "browser.tabs.hoverPreview.enabled" = true;
    "browser.tabs.hoverPreview.showThumbnails" = false;
    "browser.tabs.inTitlebar" = 0;
    "browser.translations.enable" = false;
    "browser.uidensity" = 2;
    "browser.uitour.enabled" = false;
    "browser.urlbar.suggest.addons" = false;
    "browser.urlbar.suggest.amp" = false;
    "browser.urlbar.suggest.bookmark" = false;
    "browser.urlbar.suggest.calculator" = false;
    "browser.urlbar.suggest.clipboard" = false;
    "browser.urlbar.suggest.engines" = false;
    "browser.urlbar.suggest.history" = true;
    "browser.urlbar.suggest.importantDates" = false;
    "browser.urlbar.suggest.mdn" = false;
    "browser.urlbar.suggest.openpage" = false;
    "browser.urlbar.suggest.quickactions" = false;
    "browser.urlbar.suggest.realtimeOptIn" = false;
    "browser.urlbar.suggest.recentsearches" = false;
    "browser.urlbar.suggest.remotetab" = false;
    "browser.urlbar.suggest.searches" = false;
    "browser.urlbar.suggest.sports" = false;
    "browser.urlbar.suggest.topsites" = false;
    "browser.urlbar.suggest.trending" = false;
    "browser.urlbar.suggest.weather" = false;
    "browser.urlbar.suggest.wikipedia" = false;
    "browser.urlbar.suggest.yelp" = false;
    "extensions.autoDisableScopes" = 0;
    "extensions.update.autoUpdateDefault" = false;
    "extensions.update.enabled" = false;
    "gfx.webrender.all" = true;
    "layers.acceleration.force-enabled" = true;
    "middlemouse.paste" = false;
    "mousebutton.4th.enabled" = false;
    "mousebutton.5th.enabled" = false;
    "narrate.enabled" = false;
    "network.proxy.type" = 0;
    "privacy.userContext.enabled" = false;
    "reader.content_width" = 5;
    "reader.text_alignment" = "justify";
    "svg.context-properties.content.enabled" = true;
    "ui.key.menuAccessKeyFocuses" = false;
    "zen.urlbar.behavior" = "float";
    "zen.view.compact.animate-sidebar" = false;
    "zen.view.compact.hide-tabbar" = true;
    "zen.view.compact.hide-toolbar" = true;
    "zen.welcome-screen.seen" = true;
    "zen.workspaces.continue-where-left-off" = true;
    "zen.workspaces.natural-scroll" = true;
    # keep-sorted end
  };

  extension = {
    # keep-sorted start block=yes
    "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}".settings = {
      hotkeys = {
        hotkey-toggle-translation = "";
        hotkey-translate-selected-text = "";
        hotkey-swap-page-translation-service = "";
        hotkey-show-original = "";
        hotkey-translate-page-1 = "";
        hotkey-translate-page-2 = "";
        hotkey-translate-page-3 = "";
        hotkey-hot-translate-selected-text = "";
      };

      autoTranslateWhenClickingALink = "no";
      neverTranslateLangs = [ "ru" ];
      originalUserAgent = "Mozilla/5.0 (X11; Linux x86_64; rv=146.0) Gecko/20100101 Firefox/146.0";
      pageTranslatorService = "google";
      popupPanelSection = 2;
      showButtonInTheAddressBar = "yes";
      showReleaseNotes = "no";
      showTranslateSelectedContextMenu = "no";
      targetLanguage = "ru";
      targetLanguages = [ "ru" ];
      translateClickingOnce = "yes";
      translateSelectedWhenPressTwice = "no";
      translateTextOverMouseWhenPressTwice = "no";
      useOldPopup = "no";
    };
    # keep-sorted end
  };

  policies = {
    # keep-sorted start block=yes

    AppAutoUpdate = false;
    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;
    BackgroundAppUpdate = false;
    CaptivePortal = false;
    DisableAppUpdate = true;
    DisableBuiltinPDFViewer = true;
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
    LegacyProfiles = true;
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
      Downloads = true;
      FormData = true;
      History = false;
      OfflineApps = true;
      Sessions = false;
    };
    SearchEngines = {
      Default = "Google";
      Remove = [
        "Amazon.com"
        "Bing"
        "DuckDuckGo"
        "DuckDuckGo Lite"
        "eBay"
        "MetaGer"
        "Mojeek"
        "Perplexity"
        "SearXNG - searx.be"
        "StartPage"
        "Twitter"
        "Wikipedia"
        "Wikipedia (en)"
      ];
    };
    ShowHomeButton = false;
    # keep-sorted end
  };
}
