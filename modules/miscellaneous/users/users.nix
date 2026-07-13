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
        lib,
        user,
        ...
      }:
      {
        isNormalUser = true;

        home = "/home/${user.userName}";
        createHome = true;

        hashedPasswordFile = lib.mkDefault (throw ''
          Please, set up <users.users.userName.hashedPasswordFile>.
          $ mkpasswd
        '');
      };
  };
}
