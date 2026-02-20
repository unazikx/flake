{
  pkgs,
  lib,
}:

pkgs.stdenv.mkDerivation {
  pname = "rbw-fzf";
  version = "git";

  src = pkgs.fetchurl {
    url = "https://gist.githubusercontent.com/axax-loll/94c563d81c5e8694de0e27aa588a53aa/raw/0e63b63676cf76255410add80cdbe12430b1f64d/rbw-fzf.sh";
    sha256 = "sha256-75iUjfZZWGa8qrP88tlclHOcpQ/czaq2IkvMA3Ri5p8=";
  };

  nativeBuildInputs = [ pkgs.makeWrapper ];

  unpackPhase = "true";
  installPhase = ''
    install -Dm755 $src $out/bin/rbw-fzf
    wrapProgram $out/bin/rbw-fzf \
      --prefix PATH ':' \
        "${
          lib.makeBinPath (
            with pkgs;
            [
              fzf
              rbw
              jq
            ]
          )
        }"
  '';

  meta = {
    description = "Simple menu for list data from rbw";
    homepage = "https://gist.github.com/axax-loll/94c563d81c5e8694de0e27aa588a53aa";
    license = lib.licenses.unlicense;
    platforms = [ "x86_64-linux" ];
    maintainers = with lib.maintainers; [ unazikx ];
    mainProgram = "rbw-fzf";
  };
}
