{
  ...
}:

{
  zen.hardware.security.polkit = {
    nixos =
      {
        ...
      }:
      {
        security = {
          polkit.enable = true;
          soteria.enable = true;
        };
      };
  };
}
