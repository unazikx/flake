{
  pkgs,
  lib,
}:

let
  pyPkgs = pkgs.python3Packages;
in
with pyPkgs;

# WARN:
# requires configured rbw
# NOT BW

buildPythonApplication {
  pname = "qute-rbw";
  version = "git";

  src = pkgs.fetchurl {
    url = "https://gist.githubusercontent.com/axax-loll/46ae13e0ea722203a13e318c871bb349/raw/7c3ce27ba9c850299ada26f97e46100a06029006/qute_rbw_x.py";
    sha256 = "sha256-VKeUDwKL8DzC6vJj8P8LWwnnhusfiRllIBQLIBP7GT8=";
  };

  dontUnpack = true;

  propagatedBuildInputs = [ pkgs.python3 ];

  format = "other";

  installPhase = ''
    install -Dm755 $src $out/bin/qute-rbw
  '';

  meta = {
    description = "Fill logins via rbw from qutebrowser";
    homepage = "https://gist.github.com/azikz/46ae13e0ea722203a13e318c871bb349";
    license = lib.licenses.wtfpl;
    platforms = [ "x86_64-linux" ];
    maintainers = with lib.maintainers; [ unazikx ];
    mainProgram = "qute-rbw";
  };
}
