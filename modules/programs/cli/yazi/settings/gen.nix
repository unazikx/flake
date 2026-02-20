let
  _ = sum: ext: {
    name = sum + ext;
    use = [
      "extract"
      "reveal"
    ];
  };

  app = {
    gen = _ "application/";

    rule = [
      "7z-compressed"
      "bzip"
      "bzip2"
      "gzip"
      "rar"
      "tar"
      "xz"
      "zip"
      "zstd"
    ];
  };

  ext = {
    gen = _ "*.";

    rule = [
      "7z"
      "ace"
      "ar"
      "arc"
      "bz2"
      "cab"
      "cpio"
      "cpt"
      "dgc"
      "dmg"
      "gz"
      "rar"
      "shar"
      "tar"
      "tgz"
      "xar"
      "xz"
      "zip"
      "zst"
    ];
  };
in

{
  app = with app; map gen rule;
  ext = with ext; map gen rule;
}
