# https://github.com/keenanweaver/nix-config/blob/dendritic/modules/hosts/nixos-desktop/steam.nix

{
  stdenvNoCC,
  fetchFromGitHub,
  bash,
  bubblewrap,
  cabextract,
  coreutils,
  curl,
  dbus,
  desktop-file-utils,
  file,
  fontconfig,
  gawk,
  gnutar,
  gzip,
  icoutils,
  imagemagick,
  lsof,
  makeWrapper,
  openssl,
  pciutils,
  steam,
  vulkan-tools,
  wmctrl,
  xdg-utils,
  xrandr,
  xrdb,
  xz,
  yad,
  zstd,
  lib,
}:

let
  steam-run =
    (steam.override {
      extraLibraries = pkgs: [
        pkgs.atk
        pkgs.cairo
        pkgs.fontconfig
        pkgs.gdk-pixbuf
        pkgs.glib
        pkgs.gtk3
        pkgs.pango
      ];
    }).run-free;
in

stdenvNoCC.mkDerivation (_final: {
  pname = "portproton";
  version = "1.7.5";

  src = fetchFromGitHub {
    owner = "Castro-Fidel";
    repo = "PortProton_ALT";
    rev = "06b304c35c10e48b824223c4c9f8345c87689f6d";
    hash = "sha256-JFBhrN9EKpgLOYGdSOlswBUzFKXbzeiXkeuxnDQJPKw=";
  };

  dontBuild = true;

  nativeBuildInputs = [
    makeWrapper
  ];

  path = lib.makeBinPath [
    bash
    bubblewrap
    cabextract
    coreutils
    curl
    desktop-file-utils
    dbus
    fontconfig
    file
    gawk
    gnutar
    gzip
    icoutils
    imagemagick
    lsof
    openssl
    pciutils
    vulkan-tools
    wmctrl
    xdg-utils
    xrandr
    xrdb
    xz
    yad
    zstd
  ];

  postPatch = ''
    substituteInPlace portproton \
      --replace-fail $'\tif [[ "$script_path" == "/usr/bin" ]] \\\n\t&& [[ -f "' \
      $'\tif [[ -f "'

    substituteInPlace portproton \
      --replace-fail 'rm -fr "''${PORT_WINE_DATA_PATH}/dist/"' \
      'echo "Preserving dist/ (NixOS patch)"'
  '';

  installPhase = ''
    runHook preInstall

    install -Dm755 portproton "$out/bin/.portproton-unwrapped"

    install -Dm444 ru.linux_gaming.PortProton.desktop \
      "$out/share/applications/ru.linux_gaming.PortProton.desktop"

    install -Dm444 ru.linux_gaming.PortProton.metainfo.xml \
      "$out/share/metainfo/ru.linux_gaming.PortProton.metainfo.xml"

    install -Dm444 ru.linux_gaming.PortProton.svg \
      "$out/share/icons/hicolor/scalable/apps/ru.linux_gaming.PortProton.svg"

    runHook postInstall
  '';

  postFixup = ''
    wrapProgram "$out/bin/.portproton-unwrapped" \
      --prefix PATH : ${_final.path}

    makeWrapper ${lib.getExe steam-run} "$out/bin/portproton" \
      --add-flags "$out/bin/.portproton-unwrapped"
  '';

  meta = {
    description = "Tool to easily run Windows games and software on Linux via Proton/Wine";
    homepage = "https://github.com/Castro-Fidel/PortWINE";
    license = lib.licenses.mit;
    mainProgram = "portproton";
  };
})
