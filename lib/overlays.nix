{
  inputs,
  nixConfig,
}:

with inputs;

[
  fjordlauncher.overlays.default
  glide-browser.overlays.default
  nix-minecraft.overlays.default
  niri-flake.overlays.niri
  nur.overlays.default
  nur.overlays.default

  (
    f: p:
    let
      inherit (p.stdenv.hostPlatform) system;
      config = nixConfig;
    in
    {
      agenix = agenix.packages.${system}.default;
      cursors = nix-cursors.packages.${system};
      gaming = nix-gaming.packages.${system};
      # hytale = hytale.packages.${system}.default;
      own = my-own-packages.legacyPackages.${system};
      spicetify = spicetify-nix.legacyPackages.${system};
      viu = viu.packages.${system}.default;

      _2505 = import nixpkgs-2505 { inherit system config; };
      _2511 = import nixpkgs-2511 { inherit system config; };
      _2411 = import nixpkgs-2411 { inherit system config; };

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
    }
  )
]
