{
  stdenv,
  fetchurl,
  makeWrapper,
  wofi,
  lib,
}:

stdenv.mkDerivation {
  pname = "wofi-bluetooth";
  version = "git";

  src = fetchurl {
    url = "https://raw.githubusercontent.com/unazikx/wofi-bluetooth/a4a0caf025fba65d94534471c36158e0e81c154f/wofi-bluetooth";
    sha256 = "sha256-EAh6UcH6EN19LX6OaamC8QNKkqQXGj7hDVV9zWKwSow=";
  };

  nativeBuildInputs = [ makeWrapper ];
  dontUnpack = true;

  installPhase = ''
    install -Dm755 $src $out/bin/wofi-bt
    wrapProgram $out/bin/wofi-bt \
      --prefix PATH ':' \
        "${lib.makeBinPath [ wofi ]}"
  '';

  meta = {
    description = "Control bt via wofi";
    homepage = "https://github.com/unazikx/wofi-bluetooth";
    license = lib.licenses.gpl3;
    platforms = [ "x86_64-linux" ];
    maintainers = with lib.maintainers; [ unazikx ];
    mainProgram = "wofi-bt";
  };
}
