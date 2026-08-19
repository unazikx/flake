{
  buildGoModule,
  fetchFromGitHub,
  lib,
}:

buildGoModule (_old: {
  pname = "tele";
  version = "1.11.0";

  src = fetchFromGitHub {
    owner = "sorokin-vladimir";
    repo = "tele";
    tag = "v${_old.version}";
    hash = "sha256-YUHrt8CwR1IC8L/i3N2ISVwPuICZEAL88fRVPKwJXWk=";
  };

  vendorHash = "sha256-47iIuh5BaVkBCbSv3g8+iaHW+ZEwdoHvaU+wkCCxdns=";

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
