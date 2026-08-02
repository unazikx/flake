{
  ...
}:

{
  perSystem =
    {
      self',
      ...
    }:
    {
      apps = {
        update-packages = rec {
          program = self'.packages.update-packages;
          meta = program.meta;
        };

        firefox-fetcher = rec {
          program = self'.packages.firefox-fetcher;
          meta = program.meta;
        };
      };
    };
}
