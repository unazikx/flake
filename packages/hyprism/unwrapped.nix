{
  stdenv,
  fetchurl,
  autoPatchelfHook,
  alsa-lib,
  at-spi2-atk,
  cairo,
  cups,
  expat,
  gdk-pixbuf,
  glib,
  gtk3,
  libdrm,
  libGL,
  libxkbcommon,
  mesa,
  nspr,
  nss,
  pango,
  lib,
}:

stdenv.mkDerivation (_old: {
  pname = "hyprism-unwrapped";
  version = "3.0.3";

  src = fetchurl {
    url = "https://github.com/hyprismteam/HyPrism/releases/download/v${_old.version}/HyPrism-linux-x64-${_old.version}.tar.xz";
    hash = "sha256-MGLEG3/68S9o1HNrqld8Ntbhmt6W0LlLp173QHSt9tA=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  dontConfigure = true;
  dontBuild = true;
  dontStrip = true;

  buildInputs = [
    gtk3
    glib
    nss
    nspr
    alsa-lib
    cups
    libdrm
    expat
    libxkbcommon
    mesa
    libGL
    pango
    cairo
    at-spi2-atk
    gdk-pixbuf
  ];

  autoPatchelfIgnoreMissingDeps = [
    "liblttng-ust.so.0"
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/lib/hyprism
    cp -r * $out/lib/hyprism/
    runHook postInstall
  '';

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Hytale launcher with mod management";
    homepage = "https://github.com/HyPrismTeam/HyPrism";
    license = lib.licenses.gpl3Only;
  };
})
