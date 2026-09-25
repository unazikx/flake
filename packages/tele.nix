{
  buildGoModule,
  fetchFromGitHub,
  lib,
}:

buildGoModule (_final: {
  pname = "tele";
  version = "1.11.8";

  src = fetchFromGitHub {
    owner = "sorokin-vladimir";
    repo = "tele";
    tag = "v${_final.version}";
    hash = "sha256-lk2D5U0sjoeD9CA76RuIbzE9Wj3sP3o6/oXwhoxyPso=";
  };

  vendorHash = "sha256-LcJyKDgvKj1hrDAO0ukpjb4CX3O3qyHQ4RssTcdmNO0=";

  subPackages = [ "cmd/tele" ];

  env = {
    CGO_ENABLED = "0";
  };

  ldflags = [
    "-s"
    "-w"
  ];

  meta = {
    description = "A terminal-native Telegram client built for keyboard-driven workflows";
    homepage = "https://github.com/sorokin-vladimir/tele";
    license = lib.licenses.gpl3Only;
    mainProgram = "tele";
  };
})
