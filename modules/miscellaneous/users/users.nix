{
  zen,
  ...
}:

{
  zen.miscellaneous.users = {
    includes = [
      zen.miscellaneous.users.groups
    ];

    user =
      {
        user,
        ...
      }:
      {
        isNormalUser = true;

        home = "/home/${user.userName}";
        createHome = true;
      };
  };
}
