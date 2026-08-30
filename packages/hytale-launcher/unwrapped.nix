{
  stdenv,
  fetchurl,
  at-spi2-atk,
  autoPatchelfHook,
  cairo,
  gdk-pixbuf,
  glib,
  glibc,
  gtk3,
  harfbuzz,
  libGL,
  libsoup_3,
  libX11,
  libXcomposite,
  libXdamage,
  libXext,
  libXfixes,
  libxkbcommon,
  libXrandr,
  pango,
  unzip,
  webkitgtk_4_1,
  lib,
}:

let
  version = "2026.08.28-3d62362";
  sha256 = "sha256-0cb16f69149fc2294e92474ecf8adc9e6b104c5419bed2084e61417e157aee18";

  pname = "hytale-launcher-unwrapped";

  src = fetchurl {
    url = "https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-${version}.zip";
    inherit sha256;
  };
in

stdenv.mkDerivation {
  inherit
    pname
    version
    src
    ;

  nativeBuildInputs = [
    autoPatchelfHook
    unzip
  ];

  unpackPhase = ''
    runHook preUnpack
    unzip $src -d .
    runHook postUnpack
  '';

  buildInputs = [
    webkitgtk_4_1
    gtk3
    glib
    gdk-pixbuf
    libsoup_3
    cairo
    pango
    at-spi2-atk
    harfbuzz
    glibc
  ];

  runtimeDependencies = [
    libGL
    libxkbcommon
    libX11
    libXcomposite
    libXdamage
    libXext
    libXfixes
    libXrandr
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/hytale-launcher
    install -m755 hytale-launcher $out/lib/hytale-launcher

    runHook postInstall
  '';

  meta = {
    description = "Official launcher for Hytale game (unwrapped)";
    homepage = "https://hytale.com";
    license = lib.licenses.unfree;
    mainProgram = "hytale-launcher";
  };
}
