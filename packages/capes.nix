{
  buildGoModule,
  fetchFromGitHub,
  imagemagick,
  lib,
}:

buildGoModule (_old: {
  pname = "capes";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "dorochadev";
    repo = "capes";
    rev = "55e355e06af2d950402638a1fcaba827089c9a17";
    hash = "sha256-KMVFppb2aqHsJE90s0mA5+bgMH8JK5ho6gR0Ll0CTf0=";
  };

  vendorHash = "sha256-4vgmSwtJdtvdP/6qckBORr+eTImcGAaFAKPI4Np9k00=";

  buildInputs = [
    imagemagick
  ];

  ldflags = [
    "-s"
    "-w"
  ];

  meta = {
    description = "Display Minecraft capes and player heads";
    homepage = "https://github.com/dorochadev/capes";
    license = lib.licenses.mit;
    mainProgram = "capes";
  };
})
