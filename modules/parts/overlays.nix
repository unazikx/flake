{
  ...
}:

{
  zen.flake-system.default = {
    overlays =
      {
        ...
      }:
      {
        system-backport = (
          _final: _prev: {
            inherit (_prev.stdenv.hostPlatform)
              system
              ;
          }
        );
      };
  };
}
