{
  ...
}:

{
  zen.games.strom = {
    description = ''
      packaged games for nixos
      i dont use this cause not big drive
      searching way to package games to standalone file

      list of available games:
      https://github.com/kraftwerk-gaming/strom/blob/master/README.md#games
    '';

    nixos =
      {
        ...
      }:
      {
        services.strom-ipfs-mirror = {
          enable = true;
        };
      };

    homeManager =
      {
        ...
      }:
      {
        programs.strom = {
          enable = true;

          games = [
            # inputs'.strom-nix.packages.vintage-story
          ];
        };
      };
  };
}
