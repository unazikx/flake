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
            url = "https://github.com/finix-community/finix";
            logo = "https://avatars.githubusercontent.com/u/234074672";
          }
          {
            name = "options-search";
            url = "https://finix-community.github.io/finix";
            logo = "https://avatars.githubusercontent.com/u/234074672";
          }
          {
            name = "community-modules";
            url = "https://github.com/finix-community/community-modules";
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
