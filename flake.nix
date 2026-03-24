{
  description = ''
    .__   __.  __  ___   ___ 
    |  \ |  | |  | \  \ /  / 
    |   \|  | |  |  \  V  /  
    |  . `  | |  |   >   <   
    |  |\   | |  |  /  .  \  
    |__| \__| |__| /__/ \__\ 
                             
      ______   ______   .__   __.  _______  __    _______ 
     /      | /  __  \  |  \ |  | |   ____||  |  /  _____|
    |  ,----'|  |  |  | |   \|  | |  |__   |  | |  |  __  
    |  |     |  |  |  | |  . `  | |   __|  |  | |  | |_ | 
    |  `----.|  `--'  | |  |\   | |  |     |  | |  |__| | 
     \______| \______/  |__| \__| |__|     |__|  \______| 
  '';

  inputs = {
    nixpkgs.follows = "nixpkgs-unstable";

    # nixpkgs revisions and versions
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-2505.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-2511.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-2411.url = "github:NixOS/nixpkgs/nixos-24.11";

    # flakes without dependencies
    import-tree.url = "github:vic/import-tree";
    pkgs-by-name.url = "github:drupol/pkgs-by-name-for-flake-parts";
    files.url = "github:mightyiam/files";
    flake-utils.url = "github:numtide/flake-utils";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    # flakes with dependencies
    my-own-packages = {
      url = "github:unazikx/nix-packages";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.pkgs-by-name.follows = "pkgs-by-name";
      inputs.nur.follows = "nur";
      inputs.treefmt-nix.follows = "treefmt-nix";
      inputs.emmanuelrosa-nix.follows = "emmanuelrosa-nix";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-math = {
      url = "github:xddxdd/nix-math";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    emmanuelrosa-nix = {
      url = "github:emmanuelrosa/erosanix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-wrapper-modules = {
      url = "github:BirdeeHub/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";

      # disable support
      inputs.darwin.follows = "";
      inputs.home-manager.follows = "";
    };

    agenix-rekey = {
      url = "github:oddlama/agenix-rekey";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    sopsnix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nur.follows = "nur";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nix-topology = {
      url = "github:oddlama/nix-topology";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    musnix = {
      url = "github:musnix/musnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs-2511";
    };

    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    dank-material-shell = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dank-material-shell-plugins = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.ndg.follows = "ndg";
    };

    ndg = {
      url = "github:feel-co/ndg";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # added for override nvf input

    viu = {
      url = "github:viu-media/viu";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    glide-browser = {
      url = "github:glide-browser/glide.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    firefox-addons = {
      url = "github:petrkozorezov/firefox-addons-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    obsidian-plugins = {
      url = "github:unazikx/obsidian-plugins-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    hytale-launcher = {
      url = "github:unazikx/hytale-launcher-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    shattered-prism = {
      url = "github:Noctilune/ShatteredPrism";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    steam-config-nix = {
      url = "github:different-name/steam-config-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cursors = {
      url = "github:LilleAila/nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zapret-presets = {
      url = "github:kotudemo/zapret-presets";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zapret-discord = {
      url = "github:kartavkun/zapret-discord-youtube";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    easyeffects-presets = {
      url = "github:azikxz/easyeffects-presets";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # selfmade style
    base16 = {
      url = "github:azikxz/design/base16";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers = {
      url = "github:azikxz/design/wallpapers";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # non flake tools
    umu-protonfixes = {
      url = "github:Open-Wine-Components/umu-protonfixes";
      flake = false;
    };

    betterfox = {
      url = "github:yokoffing/Betterfox";
      flake = false;
    };

    dns-malw-link = {
      url = "github:azikxz/dns.malw.link/azikx_patches";
      flake = false;
    };

    minecraft-assets = {
      url = "github:azikxz/assets";
      flake = false;
    };
  };

  outputs = args: import ./lib args;
}
