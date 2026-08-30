{
  buildFHSEnv,
  fetchurl,
  writeShellScript,
  hytale-launcher,
  makeDesktopItem,
  lib,
}:

let
  inherit (hytale-launcher.unwrapped)
    version
    ;

  name = "hytale-launcher";
in

buildFHSEnv (_old: {
  inherit
    name
    version
    ;

  targetPkgs = pkgs: [
    hytale-launcher.unwrapped
    pkgs.alsa-lib
    pkgs.at-spi2-atk
    pkgs.cacert
    pkgs.cairo
    pkgs.dbus
    pkgs.egl-wayland
    pkgs.fontconfig
    pkgs.freetype
    pkgs.gdk-pixbuf
    pkgs.glib
    pkgs.glibc
    pkgs.glib-networking
    pkgs.gtk3
    pkgs.harfbuzz
    pkgs.icu
    pkgs.krb5
    pkgs.libGL
    pkgs.libGLU
    pkgs.libglvnd
    pkgs.libsoup_3
    pkgs.libX11
    pkgs.libxcb
    pkgs.libXcomposite
    pkgs.libXcursor
    pkgs.libXdamage
    pkgs.libXext
    pkgs.libXfixes
    pkgs.libXi
    pkgs.libXinerama
    pkgs.libxkbcommon
    pkgs.libXrandr
    pkgs.libXScrnSaver
    pkgs.libXxf86vm
    pkgs.mesa
    pkgs.nspr
    pkgs.nss
    pkgs.openssl
    pkgs.pango
    pkgs.pipewire
    pkgs.pulseaudio
    pkgs.stdenv.cc.cc.lib
    pkgs.systemd
    pkgs.vulkan-loader
    pkgs.wayland
    pkgs.webkitgtk_4_1
    pkgs.zlib
  ];

  runScript = writeShellScript "hytale-launcher-wrapper" ''
    LAUNCHER_DIR="''${XDG_DATA_HOME:-$HOME/.local/share}/Hytale"
    LAUNCHER_BIN="$LAUNCHER_DIR/hytale-launcher"

    BUNDLED_HASH_FILE="$LAUNCHER_DIR/.bundled_hash"
    BUNDLED_BIN="${lib.getExe hytale-launcher.unwrapped}"
    BUNDLED_HASH=$(sha256sum "$BUNDLED_BIN" | cut -d" " -f1)

    mkdir -p "$LAUNCHER_DIR"

    if [ ! -x "$LAUNCHER_BIN" ] || [ ! -f "$BUNDLED_HASH_FILE" ] || [ "$(cat "$BUNDLED_HASH_FILE")" != "$BUNDLED_HASH" ]; then
      install -m755 "$BUNDLED_BIN" "$LAUNCHER_BIN"
      echo "$BUNDLED_HASH" > "$BUNDLED_HASH_FILE"
    fi

    export WEBKIT_DISABLE_COMPOSITING_MODE=1
    export __NV_DISABLE_EXPLICIT_SYNC=1
    export WEBKIT_DISABLE_DMABUF_RENDERER=1
    export GIO_MODULE_DIR=/usr/lib/gio/modules
    export SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt

    exec "$LAUNCHER_BIN" "$@"
  '';

  extraInstallCommands =
    # bash
    ''
      mkdir -p $out/share/applications
      cp ${_old.desktopItem}/share/applications/hytale-launcher.desktop \
        $out/share/applications

      mkdir -p $out/share/icons/hicolor/256x256/apps
      cp ${_old.desktopIcon} \
        $out/share/icons/hicolor/256x256/apps/hytale-launcher.png
    '';

  desktopItem = makeDesktopItem {
    name = "hytale-launcher";
    exec = "hytale-launcher";
    icon = "hytale-launcher";
    desktopName = "Hytale Launcher";
    comment = "Official launcher for Hytale";
    categories = [ "Game" ];
    keywords = [
      "hytale"
      "game"
      "launcher"
      "hypixel"
    ];
    startupWMClass = "com.hypixel.HytaleLauncher";
    terminal = false;
    type = "Application";
  };

  desktopIcon = fetchurl {
    url = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/hytale.png";
    sha256 = "sha256-pBATM9a3+b2fRlo0kFGaoWe/YABcEI6X80TrrmNdnio=";
  };

  meta = {
    description = "Official launcher for Hytale game";
    homepage = "https://hytale.com";
    license = lib.licenses.unfree;
    mainProgram = "hytale-launcher";
  };
})
