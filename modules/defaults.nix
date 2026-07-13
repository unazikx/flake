{
  lib,
  ...
}:

{
  den.default = {
    nixos =
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
