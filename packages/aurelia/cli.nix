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
  version = "0.1.37";

  src = fetchFromGitHub {
    owner = "Drackrath";
    repo = "Aurelia";
    tag = "v${_old.version}";
    hash = "sha256-PiMaLSgEZxMNI7AXtVULaE4FhnNk/Brje1xvGu5gFKU=";
  };

  cargoHash = "sha256-YT7muzNjxFAMwxqEPfTSK1+LHNAjbineXmsOGE9fgMU=";

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
