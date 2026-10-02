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

rustPlatform.buildRustPackage (_final: {
  pname = "aurelia";
  version = "0.1.38";

  src = fetchFromGitHub {
    owner = "Drackrath";
    repo = "Aurelia";
    tag = "v${_final.version}";
    hash = "sha256-J+YhWK1MX9VsWchk0j1xkmlxiBdehaOoSxtrzSAt1X4=";
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
