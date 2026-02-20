{
  stdenv,
  fetchurl,
  makeWrapper,
  curl,
  libxml2,
  lib,
}:

stdenv.mkDerivation {
  pname = "ytid";
  version = "stable";

  dontUnpack = true;

  nativeBuildInputs = [ makeWrapper ];

  src = fetchurl {
    url = "https://raw.githubusercontent.com/avanssion/youtube-channel-id-finder/refs/heads/master/script.sh";
    sha256 = "sha256-o+dkwHvIQMUv8/b917jW2GpSkcp/TKM1x/WkPoGeDOA=";
  };

  installPhase = ''
    install -Dm755 $src $out/bin/ytid
    wrapProgram $out/bin/ytid \
      --prefix PATH : ${
        lib.makeBinPath [
          curl
          libxml2
        ]
      }
  '';

  meta = {
    description = "Get id youtube channels from url";
    homepage = "https://github.com/avanssion/youtube-channel-id-finder";
    license = lib.licenses.mit;
    platforms = [ "x86_64-linux" ];
    maintainers = with lib.maintainers; [ azikx ];
    mainProgram = "ytid";
  };
}
