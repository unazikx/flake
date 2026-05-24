{
  lib,
  ...
}:

{
  fileSystems = lib.mkDevices.byName [
    "fatKartman"
    "fastRider"
  ];
}
