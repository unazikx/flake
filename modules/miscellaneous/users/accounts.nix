{
  zen,
  ...
}:

{
  zen.miscellaneous.users.accounts = {
    meta = {
      userIcon = {
        url = "https://avatars.githubusercontent.com/u/189107707";
        sha256 = "sha256-21tdIZfzpfJdD+HjMhQ1amEbOeYI3Zq0osqJnrgtLs8=";
      };
    };

    nixos =
      {
        pkgs,
        user,
        ...
      }:
      let
        meta = zen.miscellaneous.users.accounts.meta;
      in
      {
        services.accounts-daemon.enable = true;

        systemd.tmpfiles.settings = {
          "10-accounts-service" = {
            "/var/lib/AccountsService/users/${user.userName}" = {
              f = {
                argument = ''
                  [User]
                  Icon=${pkgs.fetchurl meta.userIcon}
                '';
              };
            };

            "/var/lib/AccountsService/icons/${user.userName}" = {
              L = {
                argument = toString (pkgs.fetchurl meta.userIcon);
              };
            };
          };
        };
      };

    homeManagerNixos =
      {
        pkgs,
        ...
      }:
      let
        meta = zen.miscellaneous.users.accounts.meta;
      in
      {
        home.file = {
          ".face".source = pkgs.fetchurl meta.userIcon;
          ".face.icon".source = pkgs.fetchurl meta.userIcon;
        };
      };
  };
}
