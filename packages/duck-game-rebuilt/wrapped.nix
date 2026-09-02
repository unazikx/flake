{
  buildFHSEnv,
  makeDesktopItem,
  mono,
  SDL2,
  duck-game-rebuilt,
  lib,
}:

buildFHSEnv (_old: {
  name = "duck-game-rebuilt";

  inherit (duck-game-rebuilt.unwrapped)
    version
    ;

  targetPkgs = _pkgs: [
    mono
    SDL2
  ];

  runScript = "${duck-game-rebuilt.unwrapped}/bin/DuckGame.sh -norebuiltupdates";

  extraInstallCommands =
    # bash
    ''
      mkdir -p $out/share/{icons,applications}

      ln -s ${duck-game-rebuilt.unwrapped}/DuckGame/DuckGame.ico \
        $out/share/icons/
        
      ln -s ${_old.desktopItem}/share/applications/* \
        $out/share/applications/
    '';

  desktopItem = makeDesktopItem {
    name = "Duck Game Rebuilt";
    exec = "DuckGameRebuilt";
    genericName = "Duck Game decompiled & rebuilt with some added features";
    desktopName = "Duck Game Rebuilt";
    icon = "DuckGame";
  };

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Duck Game decompiled & rebuilt with some added features";
    homepage = "https://github.com/TheFlyingFoool/DuckGameRebuilt";
    license = lib.licenses.unlicense;
  };
})
