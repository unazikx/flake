{
  zen,
  ...
}:

{
  den.schema = {
    host =
      {
        host,
        ...
      }:
      {
        aspect = zen.hosts.${host.hostName};
      };

    user =
      {
        user,
        ...
      }:
      {
        aspect = zen.users.${user.userName};
      };

    home =
      {
        home,
        ...
      }:
      {
        aspect = zen.homes.${home.name};
      };
  };
}
