{
  zen,
  ...
}:

{
  zen.styles.walogram = {
    description = ''
      theme builder for telegram clients
    '';

    includes = [
      zen.custom.walogram
    ];

    homeManager =
      {
        self',
        ...
      }:
      {
        stylix.targets = {
          walogram = {
            package = self'.packages.walogram;
          };
        };
      };
  };
}
