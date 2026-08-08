{
  ...
}:

{
  zen.flake-parts.default = {
    apps =
      {
        config,
        ...
      }:
      {
        update-packages = rec {
          program = config.packages.update-packages;
          meta = program.meta;
        };

        firefox-fetcher = rec {
          program = config.packages.firefox-fetcher;
          meta = program.meta;
        };
      };
  };
}
