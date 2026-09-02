{
  ...
}:

{
  zen.games.steam-config.config-files = {
    homeManagerNixos =
      {
        ...
      }:
      {
        programs.steam.config.apps."361420" = {
          files.prefix.patch = {
            "drive_c/users/steamuser/AppData/Local/Astro/Saved/Config/WindowsNoEditor/GameUserSettings.ini" = {
              format = "ini";
              content = {
                Internationalization = {
                  Language = "ru";
                  Locale = "ru";
                };

                Script.Astro.AstroGameUserSettings = {
                  bUseVSync = true;
                  bUseDynamicResolution = false;
                };
              };
            };
          };
        };
      };
  };
}
