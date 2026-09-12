{
  ...
}:

{
  zen.miscellaneous.users.getty = {
    nixos =
      {
        host,
        ...
      }:
      {
        services = {
          displayManager = {
            autoLogin.user = host.mainUser;
          };

          getty = {
            autologinUser = host.mainUser;
            autologinOnce = true;
          };

          greetd.settings = {
            default_session.user = host.mainUser;
          };
        };
      };
  };
}
