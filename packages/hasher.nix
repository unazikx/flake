{
  pkgs,
  lib,
}:

pkgs.stdenv.mkDerivation {
  pname = "hasher";
  version = "git";

  src = pkgs.fetchurl {
    url = "https://gist.githubusercontent.com/unazikx/261536eed5cefe385fa1a0b0eed7b2c2/raw/b437baf5dfcd780d53c8e5b0b6b71972a05fc0be/hasher.py";
    sha256 = "sha256-D6oP6RsSE1PFZyufs9OcivyWLbD12KfSGuc6WSuaW0o=";
  };

  buildInputs = [ pkgs.python3 ];

  unpackPhase = "true";
  installPhase = ''
    install -Dm755 $src $out/bin/hasher
  '';

  meta = {
    description = "Calculate hash for nix (links or local file)";
    homepage = "https://gist.github.com/unazikx/261536eed5cefe385fa1a0b0eed7b2c2";
    license = lib.licenses.wtfpl;
    platforms = [ "x86_64-linux" ];
    maintainers = with lib.maintainers; [ unazikx ];
    mainProgram = "hasher";
  };
}
