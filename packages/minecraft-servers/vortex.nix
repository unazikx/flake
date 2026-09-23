{
  stdenv,
  fetchzip,
  lib,
}:

stdenv.mkDerivation (_final: {
  pname = "vortex";
  version = "1.1.1b";

  src = fetchzip {
    url = "https://vortex.storage.clo.ru/download/v${_final.version}/vortex-${_final.version}-server.zip";
    sha256 = "sha256-Sx52iBk2pnDqWBWh3EP+EnByhf/GtoU3ZmBqhgciDFs=";
    stripRoot = false;
  };

  installPhase = ''
    mkdir $out
    cp -r * $out
  '';

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Custom story telling Minecraft modpack";
    homepage = "https://vrtx.su";
    license = lib.licenses.unfree;
  };
})
