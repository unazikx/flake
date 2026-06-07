{
  lib,
  ...
}:

{
  fileSystems = lib.mkDevices.byName [
    "fatKartman"
    "fastRider"
  ];

  services.kubo = {
    dataDir = toString /media/fastRider/IPFS;

    settings = {
      Datastore.StorageMax =
        let
          makeSize = size: "${toString size}GB";
        in
        makeSize 64;
    };
  };
}
