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
        programs.steam.config.apps."2737300" = {
          files.prefix.patch = {
            "drive_c/users/steamuser/AppData/Roaming/ParkingGarageRallyCircuit/settings.cfg" = {
              format = "ini";
              content = {
                settings_language = {
                  settings_change_language = 9;
                };
              };
            };
          };
        };
      };
  };
}
