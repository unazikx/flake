{
  ...
}:

{
  zen.hosts.jetpure = {
    nixos =
      {
        lib,
        ...
      }:
      {
        fileSystems = lib.drives.byName [
          "fatKartman"
          "fastRider"
        ];
      };
  };
}
