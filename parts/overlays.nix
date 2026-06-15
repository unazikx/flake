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
        _pkgs: _old:
        let
          inherit (_old.stdenv.hostPlatform)
            system
            ;

          build-branch = branch: import branch _pkgs.branch-config;
        in
        withSystem system (
          {
            inputs',
            ...
          }:
          {
            inherit system;

            _master = build-branch inputs.nixpkgs-master;
            _2505 = build-branch inputs.nixpkgs-2505;

            branch-config = {
              inherit system;
              config = {
                inherit (_pkgs.config)
                  allowBroken
                  allowInsecure
                  allowUnfree
                  ;
              };
            };

            # keep-sorted start block=yes newline_separated=yes
            _freesmlauncher = inputs.freesm-launcher.packages.${_pkgs.system}.freesmlauncher;

            _prismConfig = {
              gamemodeSupport = true;
              controllerSupport = true;
              textToSpeechSupport = false;

              jdks = _pkgs.lib.attrValues {
                inherit (_pkgs)
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

            determinate-nix = inputs'.determinate-nix.packages.nix;

            nilla-cli = inputs'.nilla-cli.packages.nilla-cli;

            driftwm = inputs'.driftwm.packages.default;

            spotify-player = _old.spotify-player.override {
              withAudioBackend = "pulseaudio";
              withStreaming = true;
              withDaemon = true;
              withMediaControl = true;

              withImage = false;
              withNotify = false;
              withSixel = false;
              withFuzzy = false;
            };

            steam-flagged = _old.lib.concatStringsSep " " [
              (_old.lib.getExe _pkgs.steam)
              "-nochatui"
              "-nofriendsui"
              "-silent"
            ];

            strom-games = inputs'.strom-nix.packages;

            freesmlauncher = _pkgs._freesmlauncher.override _pkgs._prismConfig;

            hytale-launcher = inputs.hytale-launcher.packages.${_old.system}.default;

            late = inputs'.late-sh.packages.late;

            late-sh = inputs'.late-sh.packages.late-sh;

            own = inputs'.custom-packages.legacyPackages;

            ytsub = inputs'.ytsub.packages.default;

            suwayomi-server = _old.suwayomi-server.override {
              jdk21_headless = _pkgs.temurin-jre-bin-21;
            };

            xytz = inputs'.xytz.packages.default.overrideAttrs {
              vendorHash = "sha256-j4K61ESqtlfOD8S3E0vtL18aziSFztoU3V0KSLtJEME=";
            };

            ouch = _old.ouch.override {
              enableUnfree = true;
            };

            portablemc = _old.portablemc.override {
              textToSpeechSupport = false;
              jre = _pkgs.temurin-jre-bin-25;
            };

            prismlauncher = _old.prismlauncher.override _pkgs._prismConfig;

            rc2nix = inputs'.plasma-manager.packages.rc2nix;
            # keep-sorted end

            default-lsp = _old.lib.attrValues {
              inherit (_old)
                # keep-sorted start
                black
                go
                gopls
                marksman
                nixd
                nixfmt
                prettier
                pyright
                typescript-language-server
                vscode-langservers-extracted
                yaml-language-server
                # keep-sorted end
                ;

              inherit (_old.python314Packages)
                # keep-sorted start
                python-lsp-server
                # keep-sorted end
                ;
            };
          }
        );
    };
}
