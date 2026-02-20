{
  pkgs,
  lib,
}:

pkgs.stdenv.mkDerivation {
  pname = "segoe-ui";
  version = "git";

  src = pkgs.fetchFromGitHub {
    owner = "mrbvrz";
    repo = "segoe-ui-linux";
    rev = "73b3a40c6c433d3b8149d945d4c441d4497d5f79";
    hash = "sha256-EwsoX6Rz1uaysCIxL11AHTKb2hfwKi/hNIKgG4MzR5o=";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    install -m644 $src/font/*.ttf $out/share/fonts/truetype/
  '';

  meta = {
    description = "Font used in Microsoft products for user interface text";
    homepage = "https://github.com/mrbvrz/segoe-ui-linux";
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ azikx ];
  };
}
