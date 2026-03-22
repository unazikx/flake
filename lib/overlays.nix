{
  inputs,
  nixConfig,
}:

with inputs;

[
  glide-browser.overlays.default
  niri-flake.overlays.niri
  nix-minecraft.overlays.default
  nur.overlays.default
  obsidian-plugins.overlays.default
  shattered-prism.overlays.default

  (
    _old: pkgs:
    let
      inherit (pkgs.stdenv.hostPlatform) system;
      branch-config = { inherit system config; };
      config = nixConfig;
    in
    {
      inherit system;

      own = my-own-packages.legacyPackages.${system};

      _2505 = import nixpkgs-2505 branch-config;
      _2511 = import nixpkgs-2511 branch-config;
      _2411 = import nixpkgs-2411 branch-config;

      prismlauncher = pkgs.prismlauncher.override {
        gamemodeSupport = true;
        controllerSupport = true;
        textToSpeechSupport = false;

        jdks = _old.lib.attrValues {
          inherit (_old)
            # its all LTS
            # https://adoptium.net/temurin/releases
            temurin-jre-bin-25
            temurin-jre-bin-21
            temurin-jre-bin-17
            temurin-jre-bin-8
            ;
        };
      };

      ouch = pkgs.ouch.override {
        enableUnfree = true;
      };

      spotify-player = pkgs.spotify-player.override {
        withAudioBackend = "pulseaudio";
        withStreaming = true;
        withDaemon = true;
        withMediaControl = true;

        withImage = false;
        withNotify = false;
        withSixel = false;
        withFuzzy = false;
      };

      better-than-adventure =
        (pkgs.vanillaServers.vanilla.overrideAttrs rec {
          version = "7.3_04";
          src = _old.fetchurl {
            url = "https://github.com/Better-than-Adventure/bta-download-repo/releases/download/v${version}/bta.v${version}.server.jar";
            hash = "sha256-e8hQm3NejclSo8INGtn7TxEyE3/lBq1Cz7dRsDfcx2c=";
          };

        }).override
          { jre_headless = _old.temurin-jre-bin-21; };
    }
  )
]
