{
  inputs = {
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
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs-unstable.follows = "nixpkgs";
      };
    };

    darwin.follows = "nix-darwin";

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

    flake-file = {
      type = "github";
      owner = "denful";
      repo = "flake-file";
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

    helium-flake = {
      type = "gitlab";
      owner = "ntgn";
      repo = "helium-flake";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
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

    import-tree = {
      type = "github";
      owner = "denful";
      repo = "import-tree";
    };

    late-sh = {
      type = "github";
      owner = "mpiorowski";
      repo = "late-sh";
      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
      };
    };

    make-shell = {
      type = "github";
      owner = "nicknovitski";
      repo = "make-shell";
    };

    myown = {
      type = "github";
      owner = "unazikx";
      repo = "nix-packages";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs-unstable.follows = "nixpkgs";
        nur.follows = "nur";
      };
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
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nixpkgs-stable.follows = "nixpkgs-stable";
      };
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

    nix-minecraft = {
      type = "github";
      owner = "hustlerone";
      repo = "nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      type = "github";
      owner = "kaylorben";
      repo = "nixcord";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nixos-cli = {
      type = "github";
      owner = "nix-community";
      repo = "nixos-cli";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nixpkgs.follows = "nixpkgs-unstable";

    nixpkgs-lib.follows = "nixpkgs";

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

    nur = {
      type = "github";
      owner = "nix-community";
      repo = "nur";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nvf = {
      type = "github";
      owner = "notashelf";
      repo = "nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    proxy-suite-flake = {
      type = "github";
      owner = "fufsob";
      repo = "proxy-suite-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
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
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
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
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        nur.follows = "nur";
      };
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
      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
      };
    };

    ytsub = {
      type = "github";
      owner = "sarowish";
      repo = "ytsub";
      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      inputs.import-tree [
        ./configurations
        ./modules
      ]
    );
}
