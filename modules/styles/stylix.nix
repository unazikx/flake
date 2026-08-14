{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nix-cursors = {
      type = "github";
      owner = "lilleaila";
      repo = "nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      type = "github";
      owner = "nix-community";
      repo = "stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nur.follows = "nur";
    };

    tinted-theming = {
      type = "github";
      owner = "tinted-theming";
      repo = "schemes";
      flake = false;
    };
    # keep-sorted end
  };

  zen.styles.stylix = {
    os =
      {
        ...
      }:
      {
        stylix = {
          enable = true;
          overlays.enable = true;
        };
      };

    nixos =
      {
        inputs,
        ...
      }:
      {
        imports = [ inputs.stylix.nixosModules.stylix ];
      };

    darwin =
      {
        inputs,
        ...
      }:
      {
        imports = [ inputs.stylix.darwin.stylix ];
      };

    homeManager =
      {
        ...
      }:
      {
        stylix = {
          enable = true;
          overlays.enable = true;
        };
      };

    homeManagerStandalone =
      {
        inputs,
        ...
      }:
      {
        imports = [ inputs.stylix.homeModules.stylix ];
      };
  };
}
