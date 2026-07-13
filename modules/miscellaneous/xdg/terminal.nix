{
  ...
}:

{
  zen.miscellaneous.xdg.terminal = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        xdg.terminal-exec = {
          enable = true;
          package = pkgs.xdg-terminal-exec;
        };
      };
  };
}
