{
  ...
}:

{
  zen.hosts.desyowo = {
    nixos =
      {
        lib,
        ...
      }:
      {
        services.proxy-suite = {
          tgWsProxy = {
            secret = "d4468eab06c479a1d7173ce0a50fcbc3";
            secretFile = lib.mkForce null;
          };
        };
      };
  };
}
