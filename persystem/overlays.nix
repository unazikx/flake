# INFO:
# contains every overlays and sub-packages

{
  inputs,
  ...
}:

{
  flake =
    {
      ...
    }:
    {
      overlays.default =
        with inputs;
        (
          _old: pkgs:
          let
            inherit (pkgs) lib;
            inherit (pkgs.stdenv.hostPlatform) system;

            branch-config = {
              inherit
                system
                ;

              config = {
                inherit (_old.config)
                  allowBroken
                  allowInsecure
                  allowUnfree
                  ;
              };
            };
          in
          {
            inherit system;

            _2505 = import nixpkgs-2505 branch-config;
            _2511 = import nixpkgs-2511 branch-config;
            _2411 = import nixpkgs-2411 branch-config;

            own = my-own-packages.legacyPackages.${system};

            driftwm = inputs.driftwm.packages.${system}.default;
            max-messenger = inputs.max-messenger.packages.${system}.default;
            nilla-cli = inputs.nilla-cli.packages.${system}.nilla-cli;

            zen-beta = inputs.zen-browser.packages.${system}.beta;
            zen-twilight = inputs.zen-browser.packages.${system}.twilight;
            zen-twilight-official = inputs.zen-browser.packages.${system}.twilight-official;

            default-lsp = lib.attrValues {
              inherit (pkgs)
                # keep-sorted start
                black
                go
                gopls
                marksman
                nixd
                nixfmt
                pyright
                vscode-langservers-extracted
                yaml-language-server
                # keep-sorted end
                ;

              inherit (pkgs.nodePackages)
                # keep-sorted start
                prettier
                typescript-language-server
                # keep-sorted end
                ;

              inherit (pkgs.python314Packages)
                # keep-sorted start
                python-lsp-server
                # keep-sorted end
                ;
            };

            prismlauncher = pkgs.prismlauncher.override {
              gamemodeSupport = true;
              controllerSupport = true;
              textToSpeechSupport = false;

              jdks = _old.lib.attrValues {
                inherit (_old)
                  # its all LTS
                  # https://adoptium.net/temurin/releases
                  # keep-sorted start
                  temurin-jre-bin-17
                  temurin-jre-bin-21
                  temurin-jre-bin-25
                  temurin-jre-bin-8
                  # keep-sorted end
                  ;
              };
            };

            portablemc = pkgs.portablemc.override {
              textToSpeechSupport = false;
              jre = _old.temurin-jre-bin-25;
            };

            ouch = pkgs.ouch.override {
              enableUnfree = true;
            };

            suwayomi-server = pkgs.suwayomi-server.override {
              jdk21_headless = _old.temurin-jre-bin-21;
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
        );
    };
}
