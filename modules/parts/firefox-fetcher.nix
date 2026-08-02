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
      apps.firefox-fetcher = {
        program = self'.packages.firefox-fetcher;
      };
    };
}
