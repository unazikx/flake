{
  python312Packages,
  fetchurl,
  fzf,
  hdrezka,
  mpv,
  lib,
}:

python312Packages.buildPythonApplication {
  pname = "rezka-fzf";
  version = "git";

  src = fetchurl {
    url = "https://gist.githubusercontent.com/unazikx/844a2104703e1d9382ca91dfc08a5607/raw/135aadfeaff6d7e7e70c22e9780149b0260376be/gistfile1.txt";
    sha256 = "sha256-df9oGzEKGWcU/cNBALAOf+LZ544dqraCoGBhXOIqC00=";
  };

  propagatedBuildInputs = [
    fzf
    hdrezka.api
    mpv
  ];

  dependencies = [
    python312Packages.aiohttp
    python312Packages.pyyaml
  ];

  dontUnpack = true;
  format = "other";

  installPhase = ''
    install -Dm755 $src $out/bin/rezka-fzf
  '';

  meta = {
    description = "Watch movies/series from HDRezka in terminal via fzf";
    license = lib.licenses.wtfpl;
    mainProgram = "rezka-fzf";
  };
}
