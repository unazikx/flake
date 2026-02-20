{
  pkgs,
  lib,
}:

with pkgs.python312Packages;

buildPythonApplication {
  pname = "qbittorrent-tui";
  version = "git";

  src = pkgs.fetchurl {
    url = "https://gist.githubusercontent.com/unazikx/830d05638b70779ddaf6e0645377a8bf/raw/cc3dce45e615d15ad2c1fc6cab3db8d3a638f6f6/qbitui.py";
    sha256 = "sha256-RNLz3vRlv7Hy7NtjKBYkPgc71t6jrGkpo1qUHAHDQJo=";
  };

  dontUnpack = true;

  propagatedBuildInputs = [
    pkgs.python3
    urwid
    requests
  ];

  format = "other";

  installPhase = ''
    install -Dm755 $src $out/bin/qbtui
  '';

  meta = {
    description = "Control qBittorrent via TUI";
    homepage = "https://gist.github.com/azikz/1368b57a9dd8c5af1396d6ff94ac5395";
    license = lib.licenses.wtfpl;
    platforms = [ "x86_64-linux" ];
    maintainers = with lib.maintainers; [ unazikx ];
    mainProgram = "qbt-tui";
  };
}
