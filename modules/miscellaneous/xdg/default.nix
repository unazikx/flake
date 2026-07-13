{
  zen,
  ...
}:

{
  zen.miscellaneous.xdg = {
    includes = [
      zen.miscellaneous.xdg.mime
      zen.miscellaneous.xdg.portal
      zen.miscellaneous.xdg.terminal
      zen.miscellaneous.xdg.user-dirs
    ];

    homeManager =
      {
        ...
      }:
      {
        xdg.enable = true;
      };
  };
}
