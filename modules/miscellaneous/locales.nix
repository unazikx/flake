{
  ...
}:

{
  zen.miscellaneous.locales = {
    nixos =
      {
        lib,
        options,
        ...
      }:
      {
        services = {
          chrony.enable = true;
          automatic-timezoned.enable = true;
        };

        networking.timeServers = lib.flatten [
          options.networking.timeServers.default
          "0.ru.pool.ntp.org"
          "1.ru.pool.ntp.org"
          "2.ru.pool.ntp.org"
          "3.ru.pool.ntp.org"
        ];

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
