{
  zen,
  ...
}:

{
  zen.hosts.declaoke = {
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
      };
  };

  zen.users.mathematix = {
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
