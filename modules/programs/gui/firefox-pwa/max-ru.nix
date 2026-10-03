{
  zen,
  ...
}:

{
  zen.programs.gui.firefox-pwa.max-ru = {
    description = ''
      turn websites to PWA as applications
    '';

    includes = [
      zen.programs.gui.firefox-pwa
    ];

    homeManagerNixos =
      {
        pkgs,
        lib,
        user,
        ...
      }:
      let
        meta = zen.programs.gui.firefox-pwa.meta;
      in
      {
        programs.firefoxpwa = {
          profiles."${meta.name lib user.userName}".sites = {
            "${meta.name lib "max"}" = {
              name = "Max Messenger";

              url = "https://web.max.ru";
              manifestUrl = "https://max.ru/manifest.json";

              desktopEntry = {
                icon = pkgs.npins-sources.firefoxpwa-max-messenger;
                categories = [
                  "Chat"
                  "Network"
                  "InstantMessaging"
                ];
              };
            };
          };
        };
      };
  };
}
