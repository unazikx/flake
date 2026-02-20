{
  pkgs,
  lib,
}:

pkgs.stdenv.mkDerivation {
  pname = "torque";
  version = "git";

  dontUnpack = true;

  src = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/dylanaraps/torque/refs/heads/master/torque";
    sha256 = "sha256-4PoO7Vn1/Lu2uB3UttH1PJbSMBq/dE+oJl8OoQ4YQC4=";
  };

  installPhase = ''
    install -Dm755 $src $out/bin/torque
  '';

  meta = {
    description = "TUI client for transmission on bash";
    homepage = "https://github.com/dylanaraps/torque";
    license = lib.licenses.mit;
    platforms = [ "x86_64-linux" ];
    maintainers = with lib.maintainers; [ azikx ];
    mainProgram = "torque";
  };
}
