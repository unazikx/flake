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
    nix-gaming.nixosModules.pipewireLowLatency
    nix-gaming.nixosModules.platformOptimizations
    nix-gaming.nixosModules.wine
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

  overlays = import ./overlays.nix {
    inherit inputs nixConfig;
  };

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

      pkgs = import inputs.nixpkgs {
        system = hostPlatform;
        config = nixConfig;
        inherit
          hostPlatform
          overlays
          ;
      };

      # INFO:
      # extend nixpkgs lib
      # with my own functions
      lib = nxosLib.extend (
        _final: _prev:
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
                  };

                  system = { inherit stateVersion; };
                };
              }
            )

            (import ./aliases.nix lib)
          ];
      };
    };

  inherit
    nxosLib
    homeLib
    ;
}
