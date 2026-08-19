{
  ...
}:

{
  zen.programs.cli.tele = {
    description = ''
      terminal telegram client
      by on keyboard
    '';

    homeManager =
      {
        self',
        ...
      }:
      {
        home.packages = [
          self'.packages.tele
        ];
      };
  };
}
