{
  lib,
  config,
  ...
}:

let
  inherit (config.lib.stylix.colors)
    withHashtag
    ;
in

{
  profile = {
    "app.normandy.first_run" = false;
    "browser.display.use_system_colors" = true;
    "browser.ml.linkPreview.collapsed" = true;
    "browser.ml.linkPreview.enabled" = true;
    "browser.ml.linkPreview.shift" = true;
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
  };

  extensions = {
    "uBlock0@raymondhill.net".settings = {
      selectedFilterLists = [
        "ublock-filters"
        "ublock-badware"
        "ublock-privacy"
        "ublock-unbreak"
        "ublock-quick-fixes"
      ];
    };

    "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}".settings = {
      dbInChromeStorage = true;
    };

    "84z74tXJKt8OUrTD@TSA".settings = {
      "selected_profile" = "1";
      "profiles"."1" = {
        "profile_name" = lib.userName;
        "profile_color" = withHashtag.base0B;
        "TS_address" = "http://localhost:8223";
        "catch_links" = 1;
        "category_idx" = 0;
        "clearing" = false;
      };
    };

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

    "keepassxc-browser@keepassxc.org".settings = {
      settings = {
        afterFillSorting = "sortByMatchingCredentials";
        afterFillSortingTotp = "sortByRelevantEntry";
        autoCompleteUsernames = true;
        autoFillAndSend = false;
        autoFillRelevantCredential = false;
        autoFillSingleEntry = false;
        autoFillSingleTotp = false;
        autoReconnect = false;
        autoRetrieveCredentials = true;
        autoSubmit = false;
        bannerPosition = 1;
        checkUpdateKeePassXC = 0;
        clearCredentialsTimeout = 10;
        colorTheme = "system";
        credentialSorting = "sortByGroupAndTitle";
        debugLogging = false;
        defaultGroup = "";
        defaultGroupAlwaysAsk = false;
        defaultPasskeyGroup = "";
        defaultPasswordManager = false;
        downloadFaviconAfterSave = false;
        passkeysFallback = true;
        passkeys = true;
        redirectAllowance = 1;
        saveDomainOnly = true;
        showGettingStartedGuideAlert = true;
        showGroupNameInAutocomplete = true;
        showLoginFormIcon = true;
        showLoginNotifications = false;
        showNotifications = true;
        showOTPIcon = true;
        showTroubleshootingGuideAlert = true;
        sitePreferences = [ ];
        useCompactMode = true;
        useMonochromeToolbarIcon = true;
        useObserver = true;
        usePasswordGeneratorIcons = true;
        usePredefinedSites = true;
      };

      keyRing = {
        "94557aad2f9887ab78ed919406393ab096b49fd97389b86ee38c4f55b01e2c3f" = {
          id = lib.hostName;
          key = "O3WaHGrzygEeYhuLm2xrQCYxnIYUBuCqGZBjk6enPDY=";
          hash = "94557aad2f9887ab78ed919406393ab096b49fd97389b86ee38c4f55b01e2c3f";
        };
      };
    };
  };

  policies = {
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
    HardwareAcceleration = true;
    LegacyProfiles = true;
    ManualAppUpdateOnly = true;
    NetworkPrediction = false;
    OfferToSaveLoginsDefault = false;
    OfferToSaveLogins = false;
    PasswordManagerEnabled = false;
    PDFjs.Enabled = false;
    PictureInPicture.Enabled = true;
    PrimaryPassword = false;
    PromptForDownloadLocation = false;
    ShowHomeButton = false;

    EnableTrackingProtection = {
      Value = true;
      Locked = true;
      Cryptomining = true;
      Fingerprinting = true;
      EmailTracking = true;
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

    SanitizeOnShutdown = {
      Cache = true;
      Cookies = false;
      Downloads = true;
      FormData = true;
      History = false;
      OfflineApps = true;
      Sessions = false;
    };
  };

  bookmarks =
    let
      mk = name: tags: url: {
        inherit
          name
          tags
          url
          ;
      };
    in
    [
      (mk "Bitwarden (local)" [
        "passwords"
        "security"
      ] "moz-extension://306cfb1b-562c-4188-a063-644bee12636f/popup/index.html")

      (mk "GitHub" [
        "development"
        "git"
      ] "https://github.com")

      (mk "NixOS Wiki" [
        "documentation"
        "nixos"
      ] "https://nixos.wiki")
    ];
}
