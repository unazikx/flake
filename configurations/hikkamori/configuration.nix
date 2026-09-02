{
  zen,
  ...
}:

{
  den.homes.hikkamori = {
    system = "x86_64-linux";
    class = "homeManager";
  };

  zen.homes.hikkamori = {
    includes = [
      zen.miscellaneous.version
    ];

    homeManager =
      {
        ...
      }:
      { };
  };
}
