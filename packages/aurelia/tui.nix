{
  rustPlatform,
  fetchFromGitHub,
  openssl,
  pkg-config,
  lib,
}:

rustPlatform.buildRustPackage (_old: {
  pname = "aurelia-tui";
  version = "0.1.3";

  src = fetchFromGitHub {
    owner = "Drackrath";
    repo = "Aurelia-TUI";
    rev = "v${_old.version}";
    hash = "sha256-+kk+sczxwCk7N33wVM32n4tl3G+Jt5AWMF3tcK/vT8Y=";
  };

  cargoHash = "sha256-roOxtWQDk9BSo44z62uWQi/yrZVu5bZUL4+UKkehEIk=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    openssl
  ];

  meta = {
    description = "Steam TUI Implementation of Aurelia CLI";
    homepage = "https://github.com/Drackrath/Aurelia-TUI";
    license = lib.licenses.gpl3;
    mainProgram = "aurelia-tui";
  };
})
