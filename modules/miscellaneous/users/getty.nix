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
            autoLogin.user = host.defaultUser;
          };

          getty = {
            autologinUser = host.defaultUser;
            autologinOnce = true;
          };

          greetd.settings = {
            default_session.user = host.defaultUser;
          };
        };
      };
  };
}
