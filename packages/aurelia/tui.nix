{
  stdenv,
  fetchurl,
  autoPatchelfHook,
  openssl,
  lib,
}:

stdenv.mkDerivation (_old: {
  pname = "aurelia-tui";
  version = "0.1.3";

  src = fetchurl {
    url = "https://github.com/Drackrath/Aurelia-TUI/releases/download/v${_old.version}/aurelia_tui_linux_x86_64";
    sha256 = "sha256-wk1sEaOgOdKb9XCQ2jqd7i8xRFlRwcIh5BDrEDXmmII=";
  };

  dontUnpack = true;

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    openssl
    stdenv.cc.cc.lib
  ];

  installPhase = ''
    runHook preInstall
    install -Dm755 $src $out/bin/aurelia-tui
    runHook postInstall
  '';

  meta = {
    description = "Steam TUI Implementation of Aurelia CLI";
    homepage = "https://github.com/Drackrath/Aurelia-TUI";
    license = lib.licenses.gpl3;
    mainProgram = "aurelia-tui";
  };
})
