{
  ...
}:

{
  zen.miscellaneous.lon = {
    nixos =
      {
        pkgs,
        ...
      }:
      {
        environment.systemPackages = [
          pkgs.lon
        ];
      };

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = [
          pkgs.lon
        ];
      };
  };
}
