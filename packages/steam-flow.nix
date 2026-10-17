{
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  lib,
}:

rustPlatform.buildRustPackage (_final: {
  pname = "steam-flow";
  version = "git";

  src = fetchFromGitHub {
    owner = "weter11";
    repo = "SteamFlow";
    tag = "v${_final.version}";
    hash = "sha256-hcXvBKuFPsYhz669kI0oVJ3igS1k3TLMGVaAcWXtv+o=";
  };

  cargoLock.lockFile = "${_final.src}/Cargo.lock";

  # nativeBuildInputs = [
  #   pkg-config
  # ];

  meta = {
    description = "TUI Steam launcher";
    homepage = "https://github.com/vanyapoker/steam-tui";
    license = lib.licenses.mit;
    mainProgram = "steam-tui";
  };
})
