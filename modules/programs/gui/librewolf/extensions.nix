{
  ...
}:

{
  zen.programs.gui.librewolf.extensions = {
    homeManager =
      {
        inputs',
        config,
        user,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
        myown = inputs'.myown.legacyPackages.firefox-addons;
      in
      {
        programs.librewolf = {
          profiles.${user.userName} = {
            extensions = {
              force = true;

              packages = [
                # keep-sorted start
                myown.bitwarden-password-manager
                myown.darkreader
                myown.ipfs-companion
                myown.keepassxc-browser
                myown.libredirect
                myown.mal-sync
                myown.protondb-for-steam
                myown.redirectnixwiki
                myown.sponsorblock
                myown.steam-database
                myown.styl-us
                myown.torrserver-adder
                myown.traduzir-paginas-web
                myown.ublock-origin
                myown.voice-over-translation
                myown.youtube-addon
                # keep-sorted end
              ];

              settings = {
                # keep-sorted start block=yes newline_separated=yes
                "84z74tXJKt8OUrTD@TSA".settings = {
                  "selected_profile" = "1";
                  "profiles"."1" = {
                    "profile_name" = user.userName;
                    "profile_color" = colors.base0B;
                    "TS_address" = "http://localhost:8223";
                    "catch_links" = 1;
                    "category_idx" = 0;
                    "clearing" = false;
                  };
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
                };

                "uBlock0@raymondhill.net".settings = {
                  selectedFilterLists = [
                    "ublock-filters"
                    "ublock-badware"
                    "ublock-privacy"
                    "ublock-unbreak"
                    "ublock-quick-fixes"
                  ];
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

                "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}".settings = {
                  dbInChromeStorage = true;
                };
                # keep-sorted end
              };
            };
          };
        };
      };
  };
}
