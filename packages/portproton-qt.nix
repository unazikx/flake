# https://gitlab.com/dark_siders/portprotonqt-nix
# хуй с ним, не работает, похуй:wq
#
# ❯ nix build .#portproton-qt
# ❯ /etc/nixos/result/bin/portprotonqt
# env: ‘python3’: No such file or directory

{
  stdenv,
  fetchFromGitea,
  autoPatchelfHook,
  bash,
  cabextract,
  coreutils,
  curl,
  ffmpeg_6,
  file,
  findutils,
  gawk,
  gettext,
  gnugrep,
  gnutar,
  gzip,
  makeWrapper,
  mesa-demos,
  meson,
  ninja,
  p7zip,
  pciutils,
  perlPackages,
  pkg-config,
  procps,
  psmisc,
  python3,
  qt6,
  sdl3,
  steam-run,
  unrar,
  unzip,
  vulkan-headers,
  vulkan-loader,
  writeShellScriptBin,
  xz,
  zstd,
  lib,
}:

let
  python = python3.withPackages (ps: [
    ps.requests
    ps.babel
    ps.evdev
    ps.orjson
    ps.psutil
    ps.tqdm
    ps.vdf
    ps.libarchive-c
    ps.pyside6
    ps.rapidfuzz
    ps.pefile
    ps.pillow
    ps.websocket-client
    ps.qrcode
    ps.dbus-fast
  ]);
in

stdenv.mkDerivation (_old: {
  pname = "portprotonqt";
  version = "1.4.1";

  src = fetchFromGitea {
    domain = "git.linux-gaming.ru";
    owner = "Linux-Gaming";
    repo = "PortProtonQt";
    rev = "v${_old.version}";
    sha256 = "sha256-I07eFM9lHqnu2RPpgE5v7fI69mgXVwd/X33A2vCzyVQ=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    gettext
    makeWrapper
    meson
    ninja
    pkg-config
    python
  ];

  buildInputs = [
    bash
    qt6.qtbase
    qt6.qtimageformats
    qt6.qtmultimedia
    qt6.qtsvg
    sdl3
    steam-run
    vulkan-headers
    vulkan-loader
  ]
  ++ _old.runtimeBins;

  runtimeBins = [
    cabextract
    coreutils
    curl
    ffmpeg_6
    file
    findutils
    gawk
    gnugrep
    gnugrep
    gnutar
    gzip
    mesa-demos
    p7zip
    pciutils
    perlPackages.ImageExifTool
    procps
    psmisc
    unrar
    unzip
    xz
    zstd
  ];

  dontWrapQtApps = true;

  startSh = writeShellScriptBin "start-portprotonqt" ''
    exec ${steam-run}/bin/steam-run "$(dirname "$(realpath "$0")")/start.sh.real" "$@"
  '';

  postInstall =
    let
      pythondir = "${python}/${python.sitePackages}";
    in
    # bash
    ''
      # polkit-правило и sysusers.d оставляем как в апстриме (CVE-2026-59678
      # закрыт в 1.3.1): правило теперь даёт привилегии только членам группы
      # portprotonqt, которую создаёт /lib/sysusers.d/portprotonqt.conf.
      # На NixOS группу нужно завести через users.groups.portprotonqt = { };
      # (см. README).

      # Скрипты bash-движка, которые meson положил в $out/share/portproton/scripts,
      # должны исполняться внутри FHS (steam-run), т.к. PortProton скачивает
      # динамические бинари Wine/Proton вне nix-store.
      # start.sh апстрима вычисляет PORT_SCRIPTS_PATH как dirname(realpath $0),
      # поэтому реальный скрипт обязан лежать в самой scripts/ (не в подпапке),
      # иначе он не находит functions_helper/var/conf. Переименовываем оригинал
      # и кладём рядом обёртку, запускающую двигатель внутри steam-run.
      mv "$out/share/portproton/scripts/start.sh" \
        "$out/share/portproton/scripts/start.sh.real"

      cp ${lib.getExe _old.startSh} "$out/share/portproton/scripts/start.sh"

      wrapProgram "$out/bin/portprotonqt" \
        --set PYTHONPATH "$out/${python.sitePackages}:${pythondir}" \
        --prefix PATH : ${lib.makeBinPath _old.runtimeBins}:${steam-run}/bin \
        --prefix QT_PLUGIN_PATH : ${qt6.qtbase}/${qt6.qtbase.qtPluginPrefix} \
        --set SHARUN_DIR "$out" \
        --prefix XDG_DATA_DIRS : "$out/share"

      autoPatchelf "$out/bin/portprotonqt"

      # SHARUN_DIR=$out — штатный механизм апстрима (AppImage/sharun):
      # get_portproton_scripts_path() берёт $SHARUN_DIR/share/portproton/scripts,
      # а localization.py — $SHARUN_DIR/share/locale.
      #
      # XDG_DATA_DIRS:$out/share — как в системной установке апстрима (/usr/share):
      # Qt/GIO при регистрации в xdg-desktop-portal ищет desktop-файл
      # ru.linux_gaming.PortProtonQt.desktop по XDG_DATA_DIRS самого приложения.
      # Без этого префикса портал не находит app info → ошибка
      # «Could not register app ID: App info not found».
    '';

  meta = {
    description = "Modern GUI for managing and launching games from PortProton, Steam, EGS and GOG";
    homepage = "https://git.linux-gaming.ru/Linux-Gaming/PortProtonQt";
    license = lib.licenses.gpl3;
    mainProgram = "portprotonqt";
  };
})
