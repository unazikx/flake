{
  buildFHSEnv,
  makeDesktopItem,
  hyprism,
  icu,
  libGL,
  openssl,
  lib,
}:

buildFHSEnv {
  pname = "hyprism";

  inherit (hyprism.unwrapped)
    version
    meta
    ;

  targetPkgs = _: [
    hyprism.unwrapped
    icu
    openssl
    libGL
  ];

  runScript = "${hyprism.unwrapped}/lib/hyprism/HyPrism";

  extraInstallCommands =
    let
      desktopItems = [
        (makeDesktopItem {
          name = "hyprism";
          exec = "hyprism";
          icon = "hyprism";
          comment = "Hytale launcher with mod management";
          desktopName = "HyPrism";
          categories = [ "Game" ];
        })
      ];
    in
    # bash
    ''
      mkdir -p $out/share

      ${lib.concatMapStringsSep "\n" (
        item: "cp -r --no-preserve=mode ${item}/share/* $out/share/"
      ) desktopItems}

      for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 ${hyprism.unwrapped}/lib/hyprism/resources/bin/wwwroot/icon.png \
          $out/share/icons/hicolor/''${size}x''${size}/apps/hyprism.png
      done
    '';
}
