{
  stdenv,
  fetchFromGitHub,
  lib,
}:

stdenv.mkDerivation {
  pname = "binternet";
  version = "git";

  src = fetchFromGitHub {
    owner = "Ahwxorg";
    repo = "Binternet";
    rev = "c3a3ce76bf12b8dfabebaa14f33e46181ac199d3";
    hash = "sha256-+uiORW9TDW/rlalzCqzq7VW6s/xJ2KPoG8ojF7ZWPm8=";
  };

  installPhase = ''
    mkdir $out
    cp -r * $out
  '';

  meta = {
    description = "A custom Pinterest frontend, made in PHP";
    homepage = "https://github.com/unazikx/binternet-nix";
    license = lib.licenses.gpl3Only;
  };
}
