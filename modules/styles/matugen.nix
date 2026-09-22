{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    matugen-nix = {
      type = "github";
      owner = "mois3y";
      repo = "matugen-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    matugen-nix-templates = {
      type = "github";
      owner = "unazikx";
      repo = "matugen-nix-templates";
    };
    # keep-sorted end
  };

  zen.styles.matugen = {
    nixos =
      {
        inputs,
        pkgs,
        ...
      }:
      {
        imports = [
          inputs.matugen-nix.nixosModules.matugen
        ];

        matugen = {
          enable = true;

          mode = "dark";
          # seedColor = "a988b0";

          prefer = "value";
          wallpaper = pkgs.fetchurl {
            url = "https://w.wallhaven.cc/full/og/wallhaven-ogl5z9.png";
            sha256 = "sha256-VvnBCulYtyVqJOQ5psLJyIvK8YffWPP8Stz9KgznGcY=";
          };
        };
      };

    homeManagerNixos =
      {
        inputs,
        osConfig,
        ...
      }:
      {
        imports = [
          inputs.matugen-nix.homeManagerModules.matugen
          inputs.matugen-nix-templates.homeModules.default
        ];

        matugen = {
          inherit (osConfig.matugen)
            enable
            mode
            prefer
            wallpaper
            ;
        };
      };
  };
}
