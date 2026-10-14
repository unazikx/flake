{
  ...
}:

{
  zen.miscellaneous.tack = {
    nixos =
      {
        pkgs,
        ...
      }:
      {
        environment.systemPackages = [
          pkgs.tack
        ];
      };

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = [
          pkgs.tack
        ];
      };
  };
}
