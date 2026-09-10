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
  version = "0.9.3";

  src = fetchFromGitHub {
    owner = "xdagiz";
    repo = "xytz";
    tag = "v${_old.version}";
    hash = "sha256-5+eJkgLcLAdqcTxm6uQpOJSDbSNPUNsI9TQHDVWi9V8=";
  };

  vendorHash = "sha256-4JEbi+5OO5UPRWrGgKavwGWF48/kPUEUQDd2t2f/24w=";

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
