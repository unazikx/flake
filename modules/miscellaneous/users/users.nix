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
        config,
        user,
        ...
      }:
      {
        isNormalUser = true;

        home = "/home/${user.userName}";
        createHome = true;

        hashedPasswordFile = config.sops.secrets."password/${user.userName}".path;
      };
  };
}
