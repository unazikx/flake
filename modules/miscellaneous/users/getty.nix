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

          greetd.settings = {
            default_session.user = user;
          };
        };
      };
  };
}
