{
  zen,
  ...
}:

{
  zen.hosts.jetpure = {
    includes = [
      zen.miscellaneous.users
    ];

    nixos =
      {
        self,
        host,
        ...
      }:
      {
        sops.defaultSopsFile = "${self}/secrets/${host.hostName}/sops.yaml";

        sops.secrets = {
          "password/nixzoid" = {
            neededForUsers = true;
          };

          "password/root" = {
            neededForUsers = true;
          };
        };
      };
  };

  zen.users.nixzoid = {
    homeManager =
      {
        self,
        user,
        ...
      }:
      {
        sops.defaultSopsFile = "${self}/secrets/${user.userName}/sops.yaml";
      };
  };
}
