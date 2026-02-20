{
  pkgs,
  lib,
}:

pkgs.prismlauncher.override {
  gamemodeSupport = true;
  controllerSupport = true;
  textToSpeechSupport = false;

  jdks = lib.attrValues {
    inherit (pkgs)
      # its all LTS
      # https://adoptium.net/temurin/releases
      temurin-jre-bin-25
      temurin-jre-bin-21
      temurin-jre-bin-17
      temurin-jre-bin-8
      ;
  };
}
