{
  ...
}:

{
  zen.games.duck-game-rebuilt = {
    description = ''
      decompiled Duck Game with extra features
    '';

    homeManager =
      {
        self',
        ...
      }:
      {
        home.packages = [
          self'.packages.duck-game-rebuilt-wrapped
        ];
      };
  };
}
