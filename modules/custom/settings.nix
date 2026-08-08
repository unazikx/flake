{
  inputs,
  den,
  zen,
  lib,
  ...
}:

{
  # WARN:
  # use only when { __findFile, ... }
  # example in ${self}/examples
  _module.args = {
    __findFile = den.lib.__findFile;
  };

  # INFO"
  # { zen.games.steam.nixos = { ... }; }
  # it just simpler and shorter than
  # { den.aspects = { games.steam.nixos = { ... }; }; }
  imports = lib.singleton (inputs.den.namespace "zen" true);

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
