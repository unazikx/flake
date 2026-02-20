{
  pkgs,
  lib,
}:

pkgs.stdenv.mkDerivation rec {
  pname = "tiny11";
  version = "202311";

  src = pkgs.fetchurl {
    name = "${pname}-${version}.iso";
    url = "https://archive.org/download/tiny11-2311/tiny11%202311%20x64.iso";
    # or   https://archive.org/download/tiny-11-NTDEV/tiny11%2023H2%20x64.iso
    # use another hash
    sha256 = "sha256-oCiACpGt3DXYriLc50WbZzMPfWnS8Rxw9TwP3/pbQoA=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    install -Dm755 $src $out/bin/tiny11.iso
  '';

  meta = {
    description = "Tiny11 it is windows11 sborka";
    homepage = "https://archive.org/details/tiny-11-NTDEV";
    license = lib.licenses.unlicense; # it is unfree
    platforms = [ "x86_64-linux" ];
    maintainers = with lib.maintainers; [ azikx ];
  };
}
