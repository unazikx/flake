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
    nixpkgs-unstable = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };

    nixpkgs-2505 = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-25.05";
    };

    nixpkgs-2511 = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-25.11";
    };

    nixpkgs-2411 = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-24.11";
    };

    # flakes without dependencies
    import-tree = {
      type = "github";
      owner = "vic";
      repo = "import-tree";
    };

    pkgs-by-name = {
      type = "github";
      owner = "drupol";
      repo = "pkgs-by-name-for-flake-parts";
    };

    files = {
      type = "github";
      owner = "mightyiam";
      repo = "files";
    };

    flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";
    };

    nixos-hardware = {
      type = "github";
      owner = "NixOS";
      repo = "nixos-hardware";
      ref = "master";
    };

    nix-flatpak = {
      type = "github";
      owner = "gmodena";
      repo = "nix-flatpak";
    };

    # flakes with dependencies
    my-own-packages = {
      type = "github";
      owner = "unazikx";
      repo = "nix-packages";
      inputs.nixpkgs-unstable.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.pkgs-by-name.follows = "pkgs-by-name";
      inputs.nur.follows = "nur";
      inputs.treefmt-nix.follows = "treefmt-nix";
      inputs.emmanuelrosa-nix.follows = "emmanuelrosa-nix";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    devshell = {
      type = "github";
      owner = "numtide";
      repo = "devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    make-shell = {
      type = "github";
      owner = "nicknovitski";
      repo = "make-shell";
    };

    treefmt-nix = {
      type = "github";
      owner = "numtide";
      repo = "treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-math = {
      type = "github";
      owner = "xddxdd";
      repo = "nix-math";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    emmanuelrosa-nix = {
      type = "github";
      owner = "emmanuelrosa";
      repo = "erosanix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-wrapper-modules = {
      type = "github";
      owner = "BirdeeHub";
      repo = "nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      type = "github";
      owner = "nix-community";
      repo = "impermanence";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    disko = {
      type = "github";
      owner = "nix-community";
      repo = "disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      type = "github";
      owner = "nix-community";
      repo = "nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      type = "github";
      owner = "ryantm";
      repo = "agenix";
      # disable support
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
      inputs.home-manager.follows = "";
    };

    agenix-rekey = {
      type = "github";
      owner = "oddlama";
      repo = "agenix-rekey";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    sopsnix = {
      type = "github";
      owner = "Mic92";
      repo = "sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      type = "github";
      owner = "danth";
      repo = "stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nur.follows = "nur";
    };

    nur = {
      type = "github";
      owner = "nix-community";
      repo = "NUR";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nix-topology = {
      type = "github";
      owner = "oddlama";
      repo = "nix-topology";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nix-gaming = {
      type = "github";
      owner = "fufexan";
      repo = "nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    musnix = {
      type = "github";
      owner = "musnix";
      repo = "musnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-flake = {
      type = "github";
      owner = "cmm";
      repo = "niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs-2511";
    };

    driftwm = {
      type = "github";
      owner = "malbiruk";
      repo = "driftwm";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mangowc = {
      type = "github";
      owner = "DreamMaoMao";
      repo = "mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    plasma-manager = {
      type = "github";
      owner = "nix-community";
      repo = "plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    dank-material-shell = {
      type = "github";
      owner = "AvengeMedia";
      repo = "DankMaterialShell";
      ref = "stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dank-material-shell-plugins = {
      type = "github";
      owner = "AvengeMedia";
      repo = "dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      type = "github";
      owner = "notashelf";
      repo = "nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.ndg.follows = "";
    };

    viu = {
      type = "github";
      owner = "viu-media";
      repo = "viu";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    zen-browser = {
      type = "github";
      owner = "0xc000022070";
      repo = "zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    glide-browser = {
      type = "github";
      owner = "glide-browser";
      repo = "glide.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    firefox-addons = {
      type = "github";
      owner = "petrkozorezov";
      repo = "firefox-addons-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    obsidian-plugins = {
      type = "github";
      owner = "unazikx";
      repo = "obsidian-plugins-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      type = "github";
      owner = "Gerg-L";
      repo = "spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      type = "github";
      owner = "kaylorben";
      repo = "nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    max-messenger = {
      type = "github";
      owner = "spiage";
      repo = "max-messenger";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    hytale-launcher = {
      type = "github";
      owner = "unazikx";
      repo = "hytale-launcher-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    shattered-prism = {
      type = "github";
      owner = "Noctilune";
      repo = "ShatteredPrism";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcraft = {
      type = "github";
      owner = "loystonpais";
      repo = "nixcraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    steam-config-nix = {
      type = "github";
      owner = "different-name";
      repo = "steam-config-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nix-minecraft = {
      type = "github";
      owner = "Infinidoge";
      repo = "nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cursors = {
      type = "github";
      owner = "LilleAila";
      repo = "nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    winapps = {
      type = "github";
      owner = "winapps-org";
      repo = "winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zapret-presets = {
      type = "github";
      owner = "kotudemo";
      repo = "zapret-presets";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zapret-discord = {
      type = "github";
      owner = "kartavkun";
      repo = "zapret-discord-youtube";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    telegram-ws-proxy = {
      type = "github";
      owner = "dmfrpro";
      repo = "tg-ws-proxy-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    easyeffects-presets = {
      type = "github";
      owner = "azikxz";
      repo = "easyeffects-presets";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # selfmade style
    base16 = {
      type = "github";
      owner = "azikxz";
      repo = "design";
      ref = "base16";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers = {
      type = "github";
      owner = "azikxz";
      repo = "design";
      ref = "wallpapers";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # non flake tools
    umu-protonfixes = {
      type = "github";
      owner = "Open-Wine-Components";
      repo = "umu-protonfixes";
      flake = false;
    };

    betterfox = {
      type = "github";
      owner = "yokoffing";
      repo = "Betterfox";
      flake = false;
    };

    dns-malw-link = {
      type = "github";
      owner = "ImMALWARE";
      repo = "dns.malw.link";
      flake = false;
    };

    minecraft-assets = {
      type = "github";
      owner = "azikxz";
      repo = "assets";
      flake = false;
    };
  };

  outputs = args: import ./lib args;
}
