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
    # keep-sorted start
    agenix.nixosModules.default
    dank-material-shell-plugins.nixosModules.default
    dank-material-shell.nixosModules.dank-material-shell
    disko.nixosModules.default
    home-manager.nixosModules.home-manager
    impermanence.nixosModules.impermanence
    lsfg-vk-flake.nixosModules.default
    mangowc.nixosModules.mango
    musnix.nixosModules.default
    nix-flatpak.nixosModules.nix-flatpak
    nix-gaming.nixosModules.pipewireLowLatency
    nix-gaming.nixosModules.platformOptimizations
    nix-gaming.nixosModules.wine
    nix-minecraft.nixosModules.minecraft-servers
    nixos-cli.nixosModules.nixos-cli
    nixpkgs.nixosModules.notDetected
    nur.modules.nixos.default
    # proxy-suite-flake.nixosModules.default
    sopsnix.nixosModules.default
    steam-config-nix.nixosModules.default
    stylix.nixosModules.default
    telegram-ws-proxy.nixosModules.tg-ws-proxy
    zapret-discord.nixosModules.default
    zapret-presets.nixosModules.presets
    # keep-sorted end
  ];

  homeModules = with inputs; [
    # keep-sorted start
    dank-material-shell-plugins.homeModules.default
    dank-material-shell.homeModules.dank-material-shell
    glide-browser.homeModules.default
    mangowc.hmModules.mango
    niri-flake.homeModules.niri
    niri-flake.homeModules.stylix
    nix-index-database.homeModules.default
    nixcord.homeModules.nixcord
    nixcraft.homeModules.default
    spicetify-nix.homeManagerModules.default
    telegram-ws-proxy.homeModules.tg-ws-proxy
    zen-browser.homeModules.twilight
    # keep-sorted end
  ];

  flakesOverlays = with inputs; [
    # keep-sorted start
    glide-browser.overlays.default
    niri-flake.overlays.niri
    nix-minecraft.overlays.default
    nur.overlays.default
    obsidian-plugins.overlays.default
    shattered-prism.overlays.default
    # keep-sorted end
  ];
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
      flakeDir ? "/etc/nixos",
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
        config = {
          allowBroken = true;
          allowInsecure = true;
          allowUnfree = true;
        };

        overlays = [
          self.overlays.default
        ]
        ++ flakesOverlays;

        inherit
          hostPlatform
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
            flakeDir
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
