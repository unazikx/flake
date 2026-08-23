{
  stdenv,
  fetchurl,
  autoPatchelfHook,
  bzip2,
  xz,
  zstd,
  lib,
}:

stdenv.mkDerivation (_old: {
  pname = "aurelia";
  version = "0.1.34";

  src = fetchurl {
    url = "https://github.com/Drackrath/Aurelia/releases/download/v${_old.version}/aurelia_linux_x86_64";
    sha256 = "sha256-DyE3ZrSSUKLybRbqCH4XCOAJqtdHPZ5WYvMs51dNLtc=";
  };

  dontUnpack = true;

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    bzip2
    stdenv.cc.cc.lib
    xz
    zstd
  ];

  installPhase = ''
    runHook preInstall
    install -Dm755 $src $out/bin/aurelia
    runHook postInstall
  '';

  meta = {
    description = "A fast, lightweight, command-line Steam launcher and library manager written in Rust";
    homepage = "https://github.com/Drackrath/Aurelia-TUI";
    license = lib.licenses.gpl3;
    mainProgram = "aurelia";
  };
})
