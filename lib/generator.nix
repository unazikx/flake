{
  self,
  inputs,
  ...
}:

# WARN:
# set only this options
let
  nxosLib = inputs.nixpkgs.lib;
  homeLib = inputs.home-manager.lib;

  nxosModules = with inputs; [
    agenix.nixosModules.default
    disko.nixosModules.default
    nix-flatpak.nixosModules.nix-flatpak
    # nix-gaming.nixosModules.pipewireLowLatency
    # nix-gaming.nixosModules.platformOptimizations
    # nix-gaming.nixosModules.wine
    home-manager.nixosModules.home-manager
    impermanence.nixosModules.impermanence
    mangowc.nixosModules.mango
    nix-minecraft.nixosModules.minecraft-servers
    musnix.nixosModules.default
    nixpkgs.nixosModules.notDetected
    nur.modules.nixos.default
    sopsnix.nixosModules.default
    stylix.nixosModules.default
    zapret-discord.nixosModules.default
    zapret-presets.nixosModules.presets
  ];

  homeModules = with inputs; [
    mangowc.hmModules.mango
    niri-flake.homeModules.niri
    niri-flake.homeModules.stylix
    nixcord.homeModules.nixcord
    spicetify-nix.homeManagerModules.default
  ];

  overlays = with inputs; [
    fjordlauncher.overlays.default
    glide-browser.overlays.default
    nix-minecraft.overlays.default
    niri-flake.overlays.niri
    nur.overlays.default
    nur.overlays.default

    (
      f: p:
      let
        inherit (f.stdenv.hostPlatform) system;
        config = nixConfig;
      in
      {
        agenix = agenix.packages.${system}.default;
        cursors = nix-cursors.packages.${system};
        gaming = nix-gaming.packages.${system};
        # hytale = hytale.packages.${system}.default;
        spicetify = spicetify-nix.legacyPackages.${system};
        viu = viu.packages.${system}.default;

        _2505 = import nixpkgs-2505 {
          inherit system config;
        };

        _2511 = import nixpkgs-2511 {
          inherit system config;
        };

        _2411 = import nixpkgs-2411 {
          inherit system config;
        };
      }
    )
  ];

  nixConfig = {
    allowBroken = true;
    allowInsecure = true;
    allowUnfree = true;
  };
in

# WARN:
# touch here only in cases
rec {
  buildConfiguration =
    configurationName:
    {
      hostName ? throw "Set 'hostName'",
      userName ? throw "Set 'userName'",

      hostPlatform ? throw "Set 'hostPlatform'",
      stateVersion ? "24.05",
      extraModules ? [ ],

      secretsFile ? { },
      persistDir ? null,
      winePrefix ? null,
      flakeDir ? "/etc/nixos",

      stylix ? {
        theme = null;
        image = null;
      },
    }:

    let
      specialArgs = {
        inherit
          self
          inputs
          ;
      };

      pkgs = buildPkgs {
        system = hostPlatform;
      };

      # INFO:
      # extend nixpkgs lib
      # with my own functions
      lib = nxosLib.extend (
        final: prev:
        {
          inherit (homeLib)
            hm
            ;

          inherit
            configurationName
            hostName
            userName

            secretsFile
            persistDir
            winePrefix
            flakeDir

            stylix
            ;
        }
        // (import ./functions.nix {
          inherit
            inputs
            pkgs
            lib
            ;
        })
      );
    in

    # INFO:
    # main system builder
    {
      ${configurationName} = nxosLib.nixosSystem {
        inherit
          pkgs
          lib
          specialArgs
          ;

        modules =
          nxosModules
          ++ extraModules
          ++ [
            self.diskoConfigurations.${configurationName}
            (
              { lib, config, ... }:
              let
                mkList = lib.mkOption {
                  type = lib.types.listOf lib.types.str;
                  default = [ ];
                };
              in
              {
                options = {
                  persist = {
                    directories = mkList;
                    files = mkList;

                    user = {
                      directories = mkList;
                      files = mkList;
                    };
                  };
                };

                config = {
                  networking = { inherit hostName; };

                  home-manager = {
                    extraSpecialArgs = specialArgs;
                    useGlobalPkgs = true;
                    sharedModules = [
                      {
                        home = {
                          inherit (config.system) stateVersion;

                          username = userName;
                          homeDirectory = "/home/${userName}";

                          preferXdgDirectories = true;
                        };
                      }
                    ]
                    ++ homeModules;
                  };

                  nixpkgs = {
                    inherit
                      hostPlatform
                      ;

                    overlays = [
                      (f: p: self.legacyPackages.${hostPlatform})
                    ]
                    ++ overlays;
                  };

                  system = { inherit stateVersion; };
                };
              }
            )

            (import ./aliases.nix lib)
          ];
      };
    };

  buildPkgs =
    attrs:
    import inputs.nixpkgs (
      {
        config = nixConfig;
        inherit overlays;
      }
      // attrs
    );

  inherit
    nxosLib
    homeLib
    ;
}
