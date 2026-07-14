{
  ...
}:

{
  den.hosts.darwinist = {
    system = "x86_64-darwin";
    class = "darwin";

    users = {
      apocalypse = {
        classes = [ "homeManager" ];
      };
    };
  };

  zen.hosts.darwinist = {
    includes = [ ];
  };

  zen.users.apocalypse = {
    includes = [ ];
  };
}
