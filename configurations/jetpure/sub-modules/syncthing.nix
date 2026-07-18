{
  ...
}:

{
  zen.users.nixzoid = {
    homeManager =
      {
        lib,
        config,
        osConfig,
        user,
        ...
      }:
      {
        services.syncthing = {
          guiCredentials = {
            username = user.userName;
            passwordFile = osConfig.sops.secrets."services/syncthing/gui".path;
          };

          cert = osConfig.sops.secrets."services/syncthing/cert".path or null;
          key = osConfig.sops.secrets."services/syncthing/key".path or null;

          settings = {
            devices = {
              # keep-sorted start block=yes newline_separated=yes
              "nothing2a" = {
                id = "%NOTHING2A_ID%";
                autoAcceptFolders = true;
                compression = "always";
              };
              # keep-sorted end
            };

            folders = {
              # keep-sorted start block=yes newline_separated=yes
              "${config.xdg.userDirs.music}" = {
                id = lib.hashString "md5" "music";
                devices = [ "nothing2a" ];
              };

              "${config.xdg.userDirs.publicShare}/synchron" = {
                id = lib.hashString "md5" "synchron";
                devices = [ "nothing2a" ];
              };
              # keep-sorted end
            };
          };
        };

        sops.secrets = {
          "services/syncthing/gui" = { };
          "services/syncthing/cert" = { };
          "services/syncthing/key" = { };
        };
      };
  };
}
