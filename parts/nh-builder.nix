{
  den,
  ...
}:

{
  perSystem =
    {
      pkgs,
      ...
    }:
    {
      packages = den.lib.nh.denPackages { } pkgs;
    };
}
