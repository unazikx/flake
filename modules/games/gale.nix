{
  ...
}:

{
  zen.games.gale = {
    description = ''
      thunderstore helper
      with launcher to steam
      and pretty ui ye
    '';

    homeManager =
      {
        ...
      }:
      {
        programs.gale = {
          enable = true;
        };
      };
  };
}
