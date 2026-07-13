{
  ...
}:

{
  zen.programs.gui.librewolf.bookmarks = {
    homeManager =
      {
        lib,
        user,
        ...
      }:
      {
        programs.librewolf = {
          profiles.${user.userName} = {
            bookmarks = {
              force = true;

              settings = [
                {
                  name = "Bitwarden (local)";
                  tags = [
                    "passwords"
                    "security"
                  ];
                  url = "moz-extension://306cfb1b-562c-4188-a063-644bee12636f/popup/index.html";
                }
                {
                  name = "GitHub";
                  tags = [
                    "development"
                    "git"
                  ];
                  url = "https://github.com";
                }
                {
                  name = "NixOS Wiki";
                  tags = [
                    "documentation"
                    "nixos"
                  ];
                  url = "https://nixos.wiki";
                }
              ];

              meta.maintainers = [ lib.maintainers.azikxz ];
            };
          };
        };
      };
  };
}
