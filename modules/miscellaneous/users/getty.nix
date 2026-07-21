{
  ...
}:

{
  zen.miscellaneous.users.getty = user: {
    nixos =
      {
        ...
      }:
      {
        services = {
          displayManager = {
            autoLogin.user = user;
          };

          getty = {
            autologinUser = user;
            autologinOnce = true;
          };
        };
      };
  };
}
