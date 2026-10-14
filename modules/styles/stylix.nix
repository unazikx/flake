{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    gnome-shell = {
      type = "github";
      owner = "gnome";
      repo = "gnome-shell";
      ref = "main";
      flake = false;
    };

    stylix = {
      type = "github";
      owner = "nix-community";
      repo = "stylix";
      ref = "master";
    };

    # https://tinted-theming.github.io/tinted-gallery
    tinted-schemes = {
      type = "github";
      owner = "tinted-theming";
      repo = "schemes";
      ref = "spec-0.11";
      flake = false;
    };
    # keep-sorted end
  };

  zen.styles.stylix = {
    includes = [
      zen.custom.stylix
    ];

    os =
      {
        self',
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors;
      in
      {
        stylix = {
          enable = true;
          overlays.enable = true;

          images = (
            self'.legacyPackages.images.override {
              colors = colors.toList;
            }
          );
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

    homeManager =
      {
        self',
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors;
      in
      {
        stylix = {
          enable = true;
          overlays.enable = true;

          images = (
            self'.legacyPackages.images.override {
              colors = colors.toList;
            }
          );
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
