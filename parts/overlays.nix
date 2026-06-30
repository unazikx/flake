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

            _stable = build-branch inputs.nixpkgs-2605;
            _master = build-branch inputs.nixpkgs-master;
            _2505 = build-branch inputs.nixpkgs-2505;
            _qutebrowser = build-branch inputs.nixpkgs-qutebrowser;

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

            binternet = inputs'.binternet-nix.packages.binternet;

            freesmlauncher = _pkgs._freesmlauncher.override _pkgs._prismConfig;

            hytale-launcher = inputs.hytale-launcher.packages.${_old.system}.default;

            late = inputs'.late-sh.packages.late;

            ytsub = inputs'.ytsub.packages.default;

            late-sh = inputs'.late-sh.packages.late-sh;

            own = inputs'.custom-packages.legacyPackages;

            nilla-cli = inputs'.nilla-cli.packages.nilla-cli;

            driftwm = inputs'.driftwm.packages.default;

            ouch = _old.ouch.override {
              enableUnfree = true;
            };

            pnpm_10_29_2 = _old.pnpm_10;

            pnpm_10_34_0 = _old.pnpm_10;

            portablemc = _old.portablemc.override {
              textToSpeechSupport = false;
              jre = _pkgs.temurin-jre-bin-25;
            };

            prismlauncher = _old.prismlauncher.override _pkgs._prismConfig;

            proton-ge-bin = _old.proton-ge-bin.overrideAttrs {
              pname = "proton-ge-bin";

              dontUnpack = false;
              patches = [ ./proton.patch ];

              installPhase = ''
                runHook preInstall

                echo "proton-ge-bin should not be installed into environments." > $out
                mkdir $steamcompattool
                cp -r . $steamcompattool/

                runHook postInstall
              '';
            };

            rc2nix = inputs'.plasma-manager.packages.rc2nix;

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

            suwayomi-server = _old.suwayomi-server.override {
              jdk21_headless = _pkgs.temurin-jre-bin-21;
            };

            xytz = inputs'.xytz.packages.default.overrideAttrs {
              vendorHash = "sha256-j4K61ESqtlfOD8S3E0vtL18aziSFztoU3V0KSLtJEME=";
            };
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
