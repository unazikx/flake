{
  lib,
  ...
}:

{
  zen.miscellaneous.version = {
    os =
      {
        config,
        ...
      }:
      {
        system.stateVersion = lib.mkDefault "26.05";
        system.nixos.tags = [ config.networking.hostName ];
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
