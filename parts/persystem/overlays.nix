# INFO:
# overlays with 3rd party flakes
# and nixpkgs revisions

{
  inputs,
  withSystem,
  ...
}:

{
  flake =
    {
      ...
    }:
    {
      overlays.default =
        _old: _pkgs:
        withSystem _pkgs.stdenv.hostPlatform.system (
          let
            inherit (_pkgs.stdenv.hostPlatform)
              system
              ;

            branch-config = {
              inherit system;
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
            inputs',
            ...
          }:
          {
            inherit system;

            _2505 = import inputs.nixpkgs-2505 branch-config;
            _2511 = import inputs.nixpkgs-2511 branch-config;
            _2411 = import inputs.nixpkgs-2411 branch-config;

            # keep-sorted start block=yes newline_separated=yes
            own = inputs'.custom-packages.legacyPackages;
            _freesmlauncher = inputs.freesm-launcher.packages.${_pkgs.system}.freesmlauncher;

            _prismConfig = {
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

            better-than-adventure =
              (_pkgs.vanillaServers.vanilla.overrideAttrs rec {
                version = "7.3_04";
                src = _old.fetchurl {
                  url = "https://github.com/Better-than-Adventure/bta-download-repo/releases/download/v${version}/bta.v${version}.server.jar";
                  hash = "sha256-e8hQm3NejclSo8INGtn7TxEyE3/lBq1Cz7dRsDfcx2c=";
                };
              }).override
                { jre_headless = _old.temurin-jre-bin-21; };

            driftwm = inputs.driftwm.packages.${system}.default;

            freesmlauncher = _old._freesmlauncher.override _old._prismConfig;

            hytale-launcher = inputs.hytale-launcher.packages.${_pkgs.system}.default;

            max-messenger = inputs.max-messenger.packages.${system}.default;

            nilla-cli = inputs.nilla-cli.packages.${system}.nilla-cli;

            ouch = _pkgs.ouch.override {
              enableUnfree = true;
            };

            portablemc = _pkgs.portablemc.override {
              textToSpeechSupport = false;
              jre = _old.temurin-jre-bin-25;
            };

            prismlauncher = _pkgs.prismlauncher.override _old._prismConfig;

            rc2nix = inputs.plasma-manager.packages.${system}.rc2nix;

            spotify-player = _pkgs.spotify-player.override {
              withAudioBackend = "pulseaudio";
              withStreaming = true;
              withDaemon = true;
              withMediaControl = true;

              withImage = false;
              withNotify = false;
              withSixel = false;
              withFuzzy = false;
            };

            steam-flagged = _pkgs.lib.concatStringsSep " " [
              (_pkgs.lib.getExe _old.steam)
              "-nochatui"
              "-nofriendsui"
              "-silent"
            ];

            suwayomi-server = _pkgs.suwayomi-server.override {
              jdk21_headless = _old.temurin-jre-bin-21;
            };

            xytz = inputs.xytz.packages.${system}.default.overrideAttrs {
              vendorHash = "sha256-j4K61ESqtlfOD8S3E0vtL18aziSFztoU3V0KSLtJEME=";
            };

            ytsub = inputs.ytsub.packages.${system}.default;

            zen-beta = inputs.zen-browser.packages.${system}.beta;

            zen-twilight = inputs.zen-browser.packages.${system}.twilight;

            zen-twilight-official = inputs.zen-browser.packages.${system}.twilight-official;
            # keep-sorted end

            default-lsp = _pkgs.lib.attrValues {
              inherit (_pkgs)
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

              inherit (_pkgs)
                # keep-sorted start
                prettier
                typescript-language-server
                # keep-sorted end
                ;

              inherit (_pkgs.python314Packages)
                # keep-sorted start
                python-lsp-server
                # keep-sorted end
                ;
            };
          }
        );
    };
}
