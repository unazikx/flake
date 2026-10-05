{
  ...
}:

{
  zen.miscellaneous.locales = {
    nixos =
      {
        ...
      }:
      {
        i18n = {
          defaultLocale = "en_US.UTF-8";
          extraLocaleSettings = {
            LC_TIME = "ru_RU.UTF-8";
            # cause in telegram 24h format time
          };

          extraLocales = [ "ru_RU.UTF-8/UTF-8" ];
        };
      };
  };
}
