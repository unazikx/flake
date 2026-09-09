{
  ...
}:

{
  zen.miscellaneous.finix = {
    wiki = {
      "Finix" = {
        extra = ''
          nixos distro replaces systemd to finit
        '';

        links = [
          {
            name = "main-repository";
            link = "https://github.com/finix-community/finix";
            logo = "https://avatars.githubusercontent.com/u/234074672";
          }
          {
            name = "options-search";
            link = "https://finix-community.github.io/finix";
            logo = "https://avatars.githubusercontent.com/u/234074672";
          }
          {
            name = "community-modules";
            link = "https://github.com/finix-community/community-modules";
            logo = "https://avatars.githubusercontent.com/u/234074672";
          }
        ];
      };
    };

    finix =
      {
        ...
      }:
      { };
  };
}
