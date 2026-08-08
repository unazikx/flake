{
  lib,
  ...
}:

{
  zen.miscellaneous.version = {
    os =
      {
        ...
      }:
      {
        system.stateVersion = lib.mkDefault "26.05";
      };

    homeManager =
      {
        ...
      }:
      {
        home.stateVersion = lib.mkDefault "26.05";
      };
  };
}
