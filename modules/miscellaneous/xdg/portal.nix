{
  ...
}:

{
  zen.miscellaneous.xdg.portal = {
    nixos =
      {
        ...
      }:
      {
        xdg.portal = {
          enable = true;
        };
      };

    homeManager =
      {
        ...
      }:
      {
        xdg.portal = {
          enable = true;
        };
      };
  };
}
