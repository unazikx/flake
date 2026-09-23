{
  zen,
  ...
}:

{
  zen.games.aurelia = {
    description = ''
      tui for steam games
    '';

    includes = [
      zen.games.steam
    ];

    homeManager =
      {
        self',
        ...
      }:
      {
        home.packages = [
          self'.packages.aurelia-prebuilt-base
        ];
      };
  };
}
