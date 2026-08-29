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
  version = "0.1.36";

  src = fetchFromGitHub {
    owner = "Drackrath";
    repo = "Aurelia";
    tag = "v${_old.version}";
    hash = "sha256-xI7vCQFIjCZwG+D2NoUMfbk3AiCeTBcmrM8udiU1LGk=";
  };

  cargoHash = "sha256-sAMyt0LRPH1ITUV3sgDSGjKWIt7/7zSlAdlM7R9Q9H8=";

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
