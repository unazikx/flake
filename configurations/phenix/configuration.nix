{
  zen,
  ...
}:

{
  den.hosts.phenix = {
    system = "x86_64-linux";
    class = "finix";
  };

  zen.hosts.phenix = {
    includes = [
      zen.miscellaneous.nix
    ];
  };
}
