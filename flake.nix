{
  inputs = {
    nixpkgs.follows = "nixpkgs-unstable";
    darwin.follows = "nix-darwin";

    # nixpkgs branches
    nixpkgs-unstable = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };

    nixpkgs-unstable-prev = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      rev = "567a49d1913ce81ac6e9582e3553dd90a955875f";
    };

    nixpkgs-stable = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-26.05";
    };

    nixpkgs-stable-prev = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-25.05";
    };

    # keep-sorted start block=yes newline_separated=yes
    anyrun = {
      type = "github";
      owner = "anyrun-org";
      repo = "anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    betterfox = {
      type = "github";
      owner = "yokoffing";
      repo = "betterfox";
      flake = false;
    };

    binternet-nix = {
      type = "github";
      owner = "unazikx";
      repo = "binternet-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    den = {
      type = "github";
      owner = "denful";
      repo = "den";
    };

    disko = {
      type = "github";
      owner = "nix-community";
      repo = "disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      type = "github";
      owner = "avengemedia";
      repo = "dankmaterialshell";
      ref = "stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-plugins = {
      type = "github";
      owner = "avengemedia";
      repo = "dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dns-malw-link = {
      type = "github";
      owner = "immalware";
      repo = "dns.malw.link";
      flake = false;
    };

    driftwm = {
      type = "github";
      owner = "malbiruk";
      repo = "driftwm";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    files = {
      type = "github";
      owner = "sini";
      repo = "files";
    };

    firefox-addons = {
      type = "github";
      owner = "petrkozorezov";
      repo = "firefox-addons-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-aspects = {
      type = "github";
      owner = "denful";
      repo = "flake-aspects";
    };

    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";
    };

    github-actions-nix = {
      type = "github";
      owner = "synapdeck";
      repo = "github-actions-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    glide-browser = {
      type = "github";
      owner = "glide-browser";
      repo = "glide.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    helium-flake = {
      type = "gitlab";
      owner = "ntgn";
      repo = "helium-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hytale-launcher = {
      type = "github";
      owner = "unazikx";
      repo = "hytale-launcher-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      type = "github";
      owner = "nix-community";
      repo = "impermanence";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    import-tree = {
      type = "github";
      owner = "denful";
      repo = "import-tree";
    };

    late-sh = {
      type = "github";
      owner = "mpiorowski";
      repo = "late-sh";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    make-shell = {
      type = "github";
      owner = "nicknovitski";
      repo = "make-shell";
    };

    mangowc = {
      type = "github";
      owner = "dreammaomao";
      repo = "mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    microvm-nix = {
      type = "github";
      owner = "microvm-nix";
      repo = "microvm.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    myown = {
      type = "github";
      owner = "unazikx";
      repo = "nix-packages";
      inputs.nixpkgs-unstable.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nur.follows = "nur";
    };

    nilla-cli = {
      type = "github";
      owner = "nilla-nix";
      repo = "cli";
    };

    niri-flake = {
      type = "github";
      owner = "cmm";
      repo = "niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };

    nix-cursors = {
      type = "github";
      owner = "lilleaila";
      repo = "nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      type = "github";
      owner = "nix-darwin";
      repo = "nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      type = "github";
      owner = "gmodena";
      repo = "nix-flatpak";
    };

    nix-gaming = {
      type = "github";
      owner = "fufexan";
      repo = "nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nix-math = {
      type = "github";
      owner = "xddxdd";
      repo = "nix-math";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nix-minecraft = {
      type = "github";
      owner = "hustlerone";
      repo = "nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-wrapper-modules = {
      type = "github";
      owner = "birdeehub";
      repo = "nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      type = "github";
      owner = "kaylorben";
      repo = "nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nixos-cli = {
      type = "github";
      owner = "nix-community";
      repo = "nixos-cli";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nixos-hardware = {
      type = "github";
      owner = "nixos";
      repo = "nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-millennium = {
      type = "github";
      owner = "re1n0";
      repo = "nixos-millennium";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nur = {
      type = "github";
      owner = "nix-community";
      repo = "nur";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nvf = {
      type = "github";
      owner = "notashelf";
      repo = "nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    obsidian-plugins = {
      type = "github";
      owner = "dax-dot-gay";
      repo = "nix-obsidian-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      type = "github";
      owner = "nix-community";
      repo = "plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    process-compose-flake = {
      type = "github";
      owner = "platonic-systems";
      repo = "process-compose-flake";
    };

    proxy-suite-flake = {
      type = "github";
      owner = "fufsob";
      repo = "proxy-suite-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    services-flake = {
      type = "github";
      owner = "juspay";
      repo = "services-flake";
    };

    sopsnix = {
      type = "github";
      owner = "mic92";
      repo = "sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      type = "github";
      owner = "gerg-l";
      repo = "spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    steam-config-nix = {
      type = "github";
      owner = "different-name";
      repo = "steam-config-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    strom-nix = {
      type = "github";
      owner = "kraftwerk-gaming";
      repo = "strom";
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

    treefmt-nix = {
      type = "github";
      owner = "numtide";
      repo = "treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xytz = {
      type = "github";
      owner = "xdagiz";
      repo = "xytz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    ytsub = {
      type = "github";
      owner = "sarowish";
      repo = "ytsub";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    # keep-sorted end
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      inputs.import-tree [
        ./configurations
        ./modules
        ./parts
      ]
    );
}
