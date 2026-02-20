{
  pkgs,
  lib,
}:

pkgs.stdenv.mkDerivation rec {
  pname = "torrserver";
  version = "136";

  src = pkgs.fetchurl {
    url = "https://github.com/YouROK/TorrServer/releases/download/MatriX.${version}/TorrServer-linux-amd64";
    sha256 = "sha256-3HnKxYWCVgexYMdrgbgXVzaC+PjVJJJNs4yQ6oFo8UU="; # 136
    # sha256 = "sha256-WDygG9aGnD20nGxtG0t+T2KEwbJ+fZ0uRaCndirrsXI="; # 134
  };

  nativeBuildInputs = [ pkgs.autoPatchelfHook ];
  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    install -Dm755 $src $out/bin/torrserver

    runHook postInstall
  '';

  meta = {
    description = "Server for live watch torrets";
    homepage = "https://github.com/YouROK/TorrServer";
    license = lib.licenses.gpl3;
    platforms = [ "x86_64-linux" ];
    maintainers = with lib.maintainers; [ azikx ];
    mainProgram = "torrserver";
  };
}
