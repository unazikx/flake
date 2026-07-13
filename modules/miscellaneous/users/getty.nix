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
        services.getty = {
          autologinUser = user;
          autologinOnce = true;
        };
      };
  };
}
