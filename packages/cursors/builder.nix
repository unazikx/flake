{
  stdenv,
  clickgen,
  inkscape,
  pname ? "test",
  version ? "git",
  src ? null,
  background_color ? "#00000",
  outline_color ? "#000000",
  svg_dir ? "svg",
  extra_commands ? null,
  ...
}:

stdenv.mkDerivation {
  inherit
    pname
    version
    src
    ;

  nativeBuildInputs = [
    clickgen
    inkscape
  ];

  postPatch = ''
    substituteInPlace build.toml \
      --replace "bitmaps_dir = '''" \
      "bitmaps_dir = 'bitmaps/${pname}'"

    substituteInPlace build.toml \
      --replace "platforms = ['x11', 'windows']" \
      "platforms = ['x11']"
    sed -i "s/^x11_sizes.*$//g" build.toml
    substituteInPlace build.toml \
      --replace "win_size = 32" \
      ""
    sed -i "/\[cursors.fallback_settings\]/a x11_sizes = [22, 24, 28, 32, 40, 48, 56, 64, 72, 80, 88, 96]" build.toml

    substituteInPlace build.toml \
      --replace "png = 'left_ptr_watch-*.png'" \
      "png = 'left_ptr_watch.png'"
    substituteInPlace build.toml \
      --replace "png = 'wait-*.png'" \
      "png = 'wait.png'"

    sed -i "s/^name = '[^']*'/name = '${pname}'/g" build.toml
  '';

  buildPhase =
    extra_commands
    +
    # bash
    ''
      find ${svg_dir}/ -name "*.svg" -exec sed -i 's/#00FF00/${background_color}/gi' {} \;
      find ${svg_dir}/ -name "*.svg" -exec sed -i 's/#FF0000/${background_color}/gi' {} \;
      find ${svg_dir}/ -name "*.svg" -exec sed -i 's/black/${background_color}/g' {} \;
      find ${svg_dir}/ -name "*.svg" -exec sed -i 's/#0000FF/${outline_color}/gi' {} \;
      find ${svg_dir}/ -name "*.svg" -exec sed -i 's/white/${outline_color}/g' {} \;
      mkdir -p bitmaps/${pname}
      find ${svg_dir}/ -name "*.svg" -exec sh -c 'inkscape --export-type=png --export-filename="bitmaps/${pname}/$(basename "{}" .svg).png" "{}" > /dev/null 2>&1' \;

      ctgen build.toml
    '';

  allowSubstitutes = false;
  preferLocalBuild = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r themes/${pname} $out/share/icons/
  '';
}
