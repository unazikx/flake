{
  buildGoModule,
  fetchFromGitHub,
  makeWrapper,
  ffmpeg,
  mpv,
  yt-dlp,
  lib,
}:

buildGoModule (_old: {
  pname = "xytz";
  version = "0.9.2";

  src = fetchFromGitHub {
    owner = "xdagiz";
    repo = "xytz";
    tag = "v${_old.version}";
    hash = "sha256-XKrMg1DdNaLOgj6p1k68150ZJsSniw7kHH1TllLg21A=";
  };

  vendorHash = "sha256-vCJJ0aBSBANk2eVn7Vq7hPz0V32s7xmeIfSg0jy/Dzk=";

  nativeBuildInputs = [
    makeWrapper
  ];

  doCheck = false;

  postInstall = ''
    wrapProgram "$out/bin/xytz" \
      --prefix PATH : ${
        lib.makeBinPath [
          ffmpeg
          mpv
          yt-dlp
        ]
      }
  '';

  meta = with lib; {
    description = "a beautiful TUI YouTube Downloader";
    homepage = "https://github.com/xdagiz/xytz";
    license = licenses.mit;
    mainProgram = "xytz";
  };
})
