{
  inputs,
  nixConfig,
}:

with inputs;

[
  shattered-prism.overlays.default
  glide-browser.overlays.default
  nix-minecraft.overlays.default
  niri-flake.overlays.niri
  nur.overlays.default

  (
    f: p:
    let
      inherit (p.stdenv.hostPlatform) system;
      config = nixConfig;
    in
    {
      own = my-own-packages.legacyPackages.${system};

      _2505 = import nixpkgs-2505 { inherit system config; };
      _2511 = import nixpkgs-2511 { inherit system config; };
      _2411 = import nixpkgs-2411 { inherit system config; };

      system = p.stdenv.hostPlatform.system;

      prismlauncher = p.prismlauncher.override {
        gamemodeSupport = true;
        controllerSupport = true;
        textToSpeechSupport = false;

        jdks = f.lib.attrValues {
          inherit (f)
            # its all LTS
            # https://adoptium.net/temurin/releases
            temurin-jre-bin-25
            temurin-jre-bin-21
            temurin-jre-bin-17
            temurin-jre-bin-8
            ;
        };
      };

      ouch = p.ouch.override {
        enableUnfree = true;
      };

      spotify-player = p.spotify-player.override {
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
        (p.vanillaServers.vanilla.overrideAttrs rec {
          version = "7.3_04";
          src = f.fetchurl {
            url = "https://github.com/Better-than-Adventure/bta-download-repo/releases/download/v${version}/bta.v${version}.server.jar";
            hash = "sha256-e8hQm3NejclSo8INGtn7TxEyE3/lBq1Cz7dRsDfcx2c=";
          };

        }).override
          { jre_headless = f.temurin-jre-bin-21; };
    }
  )
]
