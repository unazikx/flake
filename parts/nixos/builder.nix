# INFO:
# nixos configurations builder
# imports modules and other things

{
  self,
  inputs,
  config,
  ...
}:

# INFO:
# nixos and hjem modules
let
  nixosModules = with inputs; [
    # keep-sorted start
    agenix.nixosModules.default
    dank-material-shell-plugins.nixosModules.default
    dank-material-shell.nixosModules.dank-material-shell
    disko.nixosModules.default
    helium-flake.nixosModules.helium
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
    proxy-suite-flake.nixosModules.default
    sopsnix.nixosModules.default
    steam-config-nix.nixosModules.default
    stylix.nixosModules.default
    # keep-sorted end
  ];

  homeModules = with inputs; [
    # keep-sorted start
    # anyrun.homeManagerModules.default
    dank-material-shell-plugins.homeModules.default
    dank-material-shell.homeModules.dank-material-shell
    glide-browser.homeModules.default
    helium-flake.homeModules.helium
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

  overlays = with inputs; [
    # keep-sorted start
    glide-browser.overlays.default
    niri-flake.overlays.niri
    nix-minecraft.overlays.default
    nur.overlays.default
    obsidian-plugins.overlays.default
    shattered-prism.overlays.default
    neu-nix.overlays.default
    # keep-sorted end
  ];
in

# WARN:
# edit only in cases
{
  flake =
    {
      ...
    }:
    {
      lib.buildNixos =
        # INFO:
        # arguments for bypass
        configurationName:
        {
          hostName ? throw "Set up <hostName>",
          userName ? throw "Set up <userName>",
          hostPlatform ? throw "Set up <hostPlatform>",
          flakeDir ? "/etc/nixos",
          extraModules ? [ ],
        }:

        # INFO:
        # builder itself
        {
          ${configurationName} = inputs.nixpkgs.lib.nixosSystem (
            let
              specialArgs = {
                inherit
                  self
                  inputs
                  ;

                partsConfig = config.flake;
              };

              pkgs = import inputs.nixpkgs {
                inherit hostPlatform;

                system = hostPlatform;

                config = {
                  allowBroken = true;
                  allowInsecure = true;
                  allowUnfree = true;
                };

                overlays = lib.flatten [
                  config.flake.overlays.default
                  overlays
                ];
              };

              lib = inputs.nixpkgs.lib.extend (
                _final: _prev:
                (
                  {
                    inherit (inputs.home-manager.lib)
                      hm
                      ;

                    inherit
                      configurationName
                      hostName
                      userName
                      hostPlatform
                      flakeDir
                      ;
                  }
                  // (import ./_functions.nix {
                    inherit
                      self
                      inputs
                      pkgs
                      lib
                      ;
                  })
                )
              );
            in
            {
              inherit
                specialArgs
                pkgs
                lib
                ;

              modules = lib.flatten [
                (
                  {
                    lib,
                    config,
                    ...
                  }:
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
                        sharedModules = lib.flatten [
                          {
                            home = {
                              inherit (config.system) stateVersion;

                              username = userName;
                              homeDirectory = "/home/${userName}";

                              preferXdgDirectories = true;
                            };
                          }

                          homeModules
                        ];
                      };

                      system.stateVersion = lib.mkDefault "26.05";
                    };
                  }
                )

                (import ./_aliases.nix {
                  inherit lib;
                })

                extraModules
                nixosModules
              ];
            }
          );
        };
    };
}
