{
  ...
}:

{
  zen.programs.cli.anime.anicliru = {
    description = ''
      usage
      anicli -> anicli-ru -q 1440

      to use anilib auth follow this
      https://github.com/vypivshiy/anicli-api/issues/42#issuecomment-2889017544
    '';

    homeManager =
      {
        self',
        ...
      }:
      {
        home.packages = [
          self'.legacyPackages.ani-cli-ru.client
        ];
      };
  };
}
