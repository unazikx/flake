{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    betterfox = {
      type = "github";
      owner = "yokoffing";
      repo = "betterfox";
      flake = false;
    };
    # keep-sorted end
  };

  zen.programs.gui.firefox = {
    description = ''
      just default browser for my parents
    '';

    includes = [
      zen.programs.gui.firefox.extensions
      zen.programs.gui.firefox.policies
      zen.programs.gui.firefox.profiles
    ];

    homeManager =
      {
        user,
        ...
      }:
      {
        programs.firefox = {
          enable = true;

          languagePacks = [
            "ru-RU"
          ];
        };

        stylix.targets = {
          firefox = {
            colorTheme.enable = true;
            profileNames = [ user.userName ];
          };
        };
      };
  };
}
