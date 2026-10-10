# not working, https://t.me/ru_nixos/409831
# fix it youself

{
  mkWindowsAppNoCC,
  torrent-sources,
  wine ? wineWow64Packages.staging,
  wineWow64Packages,
}:

mkWindowsAppNoCC rec {
  inherit wine;

  pname = "sketchup";
  version = "torrent";

  src = torrent-sources.sketchup;

  dontUnpack = true;
  wineArch = "win64";
  enableMonoBootPrompt = false;

  enableVulkan = true;
  graphicsDriver = "auto";

  winAppInstall =
    # bash
    ''
      winetricks --unattended corefonts win10 vkd3d \
        dxvk2030 msxml3 msxml6 gdiplus vcrun2013 vcrun2022

      wine "${src}/SketchUp.Pro.v26.1.189.exe"
    '';

  winAppRun =
    # bash
    ''
      wine "C:\Program Files\SketchUp\SketchUp 2026\SketchUp\SketchUp.exe" "$ARGS"
    '';

  installPhase = ''
    runHook preInstall
    ln -s $out/bin/.launcher $out/bin/sketchup
    runHook postInstall
  '';
}
