{
  lib,
  ...
}:

let
  mkMime = mime: use: {
    inherit
      mime
      use
      ;
  };

  mkName = url: use: {
    inherit
      url
      use
      ;
  };

  gen = import ./gen.nix;
in

{
  prepend_rules = [
    (mkName "*.kdbx" [ "kdbx" ])
    (mkName "*.exe" [ "exe" ])
    (mkName "*.pdf" [ "pdf" ])
    (mkName "*.torrent" [ "torrent" ])
  ];

  rules =
    (gen.ext ++ gen.app)

    ++ [
      (mkMime "image/*" [
        "image"
        "open"
      ])

      (mkMime "{audio,video}/*" [
        "play"
        "open"
      ])

      (mkName
        "*.{${
          lib.concatStringsSep "," [
            "csv"
            "tsv"
            "tab"
            "psv"

            "odt"
            "doc"
            "docx"
            "rtf"

            "xls"
            "xlsx"
            "xlsm"
            "xlsb"
            "ods"

            "odp"
            "ppt"
            "pptx"

            "odf"
            "odb"
          ]
        }}"
        [
          "officePdf"
          "office"
        ]
      )
    ]

    ++ (map (n: (mkMime n [ "native" ])) [
      "application/executable"
      "application/pie-executable"
      "text/shellscript"

      "application/x-executable"
      "application/x-pie-executable"
      "text/x-shellscript"
    ])

    ++ (map (n: (mkMime n [ "pdf" ])) [
      "application/pdf"
      "application/zip"

      "application/cbt"
      "application/cbr"
      "application/cbz"

      "application/x-cbt"
      "application/x-cbr"
      "application/x-cbz"
      "application/epub+zip"

      "application/vnd.comicbook-rar"
      "application/vnd.comicbook+zip"
    ])

    ++ (map (n: (mkMime n [ "edit" ])) [
      "inode/empty"
      "application/*"
      "text/*"
    ])
    ++ [ (mkMime "*/" [ "open" ]) ];
}
