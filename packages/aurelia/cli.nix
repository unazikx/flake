{
  rustPlatform,
  fetchFromGitHub,
  bzip2,
  cmake,
  perl,
  pkg-config,
  xz,
  zstd,
  lib,
}:

rustPlatform.buildRustPackage (_old: {
  pname = "aurelia";
  version = "0.1.34";

  src = fetchFromGitHub {
    owner = "Drackrath";
    repo = "Aurelia";
    tag = "v${_old.version}";
    hash = "sha256-V8b44Iq3Ld3zeDVFkv+6flIXBqBrVzoB6aUpdBad6C8=";
  };

  cargoHash = "sha256-oSS28Qv4lDcWIItjev2+WLGxFUGDtgFxYeUW81jC3wA=";

  nativeBuildInputs = [
    cmake
    perl
    pkg-config
    rustPlatform.bindgenHook
  ];

  buildInputs = [
    bzip2
    xz
    zstd
  ];

  meta = {
    description = "Aurelia CLI Steam launcher";
    homepage = "https://github.com/Drackrath/Aurelia";
    license = lib.licenses.gpl3;
    mainProgram = "aurelia";
  };
})
