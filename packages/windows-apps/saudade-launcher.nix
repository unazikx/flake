{
  mkWindowsApp,
  fetchurl,
  wineWow64Packages,
  lib,
}:

mkWindowsApp rec {
  pname = "saudade-launcher";
  version = "1.0.0";

  wine = wineWow64Packages.wayland;
  wineArch = "win64";
  enableMonoBootPrompt = false;

  src = fetchurl {
    url = "https://mow-launcher.saudade-studio.ru/launcher/v1/launcher/stable/SaudadeLauncher_Setup-latest.exe";
    sha256 = "sha256-lFdb3VoSPQ3M965afEaTH4pHKiYPU2jUTM1WJ8AjB2k=";
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    ln -s $out/bin/.launcher $out/bin/${pname}
    runHook postInstall
  '';

  winAppInstall =
    # bash
    ''
      $WINE ${src}
    '';

  winAppRun =
    # bash
    ''
      $WINE "$WINEPREFIX/drive_c/users/steamuser/AppData/Local/Saudade Launcher/Saudade Launcher.exe" "$ARGS"
    '';

  meta = {
    description = "Russian launcher for playing Minecraft Modpacks. (fucking shit)";
    homepage = "https://saudade-studio.ru";
    license = lib.licenses.unfree;
  };
}
