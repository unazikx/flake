{
  inputs = {
    betterfox = {
      type = "github";
      owner = "yokoffing";
      repo = "betterfox";
      flake = false;
    };

    dag = {
      type = "github";
      owner = "denful";
      repo = "dag";
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

    dns-malw-link = {
      type = "github";
      owner = "immalware";
      repo = "dns.malw.link";
      flake = false;
    };

    erosanix = {
      type = "github";
      owner = "emmanuelrosa";
      repo = "erosanix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    files = {
      type = "github";
      owner = "sini";
      repo = "files";
    };

    finix = {
      type = "github";
      owner = "finix-community";
      repo = "finix";
    };

    finix-community = {
      type = "github";
      owner = "finix-community";
      repo = "community-modules";
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

    hjem = {
      type = "github";
      owner = "feel-co";
      repo = "hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem-rum = {
      type = "github";
      owner = "snugnug";
      repo = "hjem-rum";
      inputs = {
        hjem.follows = "hjem";
        nixpkgs.follows = "nixpkgs";
      };
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    import-tree = {
      type = "github";
      owner = "denful";
      repo = "import-tree";
    };

    make-shell = {
      type = "github";
      owner = "nicknovitski";
      repo = "make-shell";
    };

    massgrave = {
      type = "github";
      owner = "massgravel";
      repo = "microsoft-activation-scripts";
      flake = false;
    };

    microvm-nix = {
      type = "github";
      owner = "microvm-nix";
      repo = "microvm.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      type = "github";
      owner = "nix-darwin";
      repo = "nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-math = {
      type = "github";
      owner = "xddxdd";
      repo = "nix-math";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nix-minecraft = {
      type = "github";
      owner = "hustlerone";
      repo = "nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
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

    nixos-hardware = {
      type = "github";
      owner = "NixOS";
      repo = "nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.follows = "nixpkgs-unstable";

    nixpkgs-easyeffects = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-25.05";
    };

    nixpkgs-fixed = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      rev = "567a49d1913ce81ac6e9582e3553dd90a955875f";
    };

    nixpkgs-lib.follows = "nixpkgs";

    nixpkgs-master = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "master";
    };

    nixpkgs-stable = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-26.05";
    };

    nixpkgs-unstable = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-unstable";
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

    pkgs-by-name-for-flake-parts = {
      type = "github";
      owner = "drupol";
      repo = "pkgs-by-name-for-flake-parts";
    };

    proxy-suite-flake = {
      type = "github";
      owner = "fufsob";
      repo = "proxy-suite-flake";
      inputs.nixpkgs.follows = "nixpkgs";
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
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    stylix = {
      type = "github";
      owner = "nix-community";
      repo = "stylix";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        nur.follows = "nur";
      };
    };

    tinted-theming = {
      type = "github";
      owner = "tinted-theming";
      repo = "schemes";
      flake = false;
    };

    umbriel = {
      type = "github";
      owner = "noctalia-dev";
      repo = "umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vicinae-extensions = {
      type = "github";
      owner = "vicinaehq";
      repo = "extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    winapps = {
      type = "github";
      owner = "winapps-org";
      repo = "winapps";
      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
      };
    };

    with-inputs = {
      type = "github";
      owner = "denful";
      repo = "with-inputs";
    };

    xmcl = {
      type = "github";
      owner = "x45iq";
      repo = "xmcl-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake
      {
        inherit inputs;
      }
      (
        inputs.import-tree [
          ./configurations
          ./files
          ./modules
          ./shells
        ]
      );
}
