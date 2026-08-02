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
      apps.chrome-fetcher = {
        program = self'.packages.chrome-fetcher;
      };
    };
}
