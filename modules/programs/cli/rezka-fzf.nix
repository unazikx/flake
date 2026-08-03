{
  ...
}:

{
  zen.programs.cli.rezka-fzf = {
    description = ''
      simple rezka client
      for viewing series and movies via mpv
    '';

    homeManager =
      {
        self',
        ...
      }:
      {
        home.packages = [
          self'.legacyPackages.hdrezka.client
        ];
      };
  };
}
