{
  stdenv,
  fetchurl,
  unzip,
  lib,
}:

stdenv.mkDerivation (_old: {
  pname = "duck-game-rebuilt-unwrapped";
  version = "1.4.7";

  src = fetchurl {
    url = "https://github.com/TheFlyingFoool/DuckGameRebuilt/releases/download/v${_old.version}/DuckGameRebuilt.zip";
    sha256 = "1idnca210wdvlq6224i1961hqk72cxhljg9myfacccq7bkl997fw";
  };

  nativeBuildInputs = [
    unzip
  ];

  dontBuild = true;
  dontConfigure = true;
  dontStrip = true;

  unpackPhase = ''
    mkdir -p $out/bin
    unzip $src -d $out/bin
  '';

  installPhase = ''
    chmod +x $out/bin/DuckGame.sh
  '';

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Duck Game decompiled & rebuilt with some added features (unwrapped)";
    homepage = "https://github.com/TheFlyingFoool/DuckGameRebuilt";
    license = lib.licenses.unlicense;
    mainProgram = "DuckGame.sh";
  };
})
