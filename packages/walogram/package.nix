{
  writeShellApplication,
  imagemagick,
  zip,
  outputDir ? toString null,
  colors ? {
    base00 = "#151515";
    base01 = "#1f1f1f";
    base02 = "#2e2e2e";
    base03 = "#424242";
    base04 = "#bbb6b6";
    base05 = "#e8e3e3";
    base06 = "#e8e3e3";
    base07 = "#e8e3e3";
    base08 = "#b66467";
    base09 = "#d9bc8c";
    base0A = "#d9bc8c";
    base0B = "#8c977d";
    base0C = "#8aa6a2";
    base0D = "#8da3b9";
    base0E = "#a988b0";
    base0F = "#bbb6b6";
    base10 = "#151515";
    base11 = "#151515";
    base12 = "#b66467";
    base13 = "#d9bc8c";
    base14 = "#8c977d";
    base15 = "#8aa6a2";
    base16 = "#8da3b9";
  },
}:

writeShellApplication {
  name = "walogram";

  runtimeInputs = [
    imagemagick
    zip
  ];

  text = ''
    tempdir="$(mktemp -d)"
    cachedir="${outputDir}"
    themename="stylix.tdesktop-theme"
    walname="background.jpg"

    rm -f "$cachedir/$themename"
    mkdir -p "$cachedir"

    cat << EOF > "$tempdir/colors.tdesktop-theme"
    ${import ./theme.nix colors}
    EOF

    magick -size 256x256 \
      "gradient:${colors.base01}-${colors.base00}" \
      "$tempdir/$walname"

    zip -jq -FS \
      "$cachedir/$themename" \
      "$tempdir"/*
  '';
}
