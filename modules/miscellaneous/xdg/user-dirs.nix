{
  ...
}:

{
  zen.miscellaneous.xdg.user-dirs = {
    homeManager =
      {
        config,
        ...
      }:
      let
        cfg = config.xdg.userDirs;
        home = config.home.homeDirectory;
      in
      {
        xdg.userDirs = {
          enable = true;

          createDirectories = true;
          setSessionVariables = true;

          desktop = "${home}/Desktop";
          documents = "${home}/Documents";
          download = "${home}/Downloads";
          music = "${home}/Music";
          pictures = "${home}/Pictures";
          videos = "${home}/Videos";
          publicShare = "${home}/Public";

          templates = null;
          projects = null;

          extraConfig = {
            SCREENSHOTS = "${cfg.pictures}/screenshots";
            PASSWORDS = "${cfg.publicShare}/passwords";
          };
        };
      };
  };
}
