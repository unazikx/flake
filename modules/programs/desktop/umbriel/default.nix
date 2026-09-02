{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    umbriel = {
      type = "github";
      owner = "noctalia-dev";
      repo = "umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xdg-desktop-portal-umbriel = {
      type = "github";
      owner = "noctalia-dev";
      repo = "xdg-desktop-portal-umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.programs.desktop.umbriel = {
    description = ''
      modern window manager
      from authors Noctalia
    '';

    includes = [
      zen.programs.desktop.noctalia
    ];

    wiki = {
      "Umbriel" = {
        links = [
          {
            name = "umbriel-wiki";
            url = "https://docs.noctalia.dev/umbriel";
            logo = "https://docs.noctalia.dev/_astro/noctalia-logo.BwXc-yKG.svg";
          }
        ];
      };
    };

    nixos =
      {
        self',
        inputs,
        ...
      }:
      {
        imports = [
          inputs.umbriel.nixosModules.default
        ];

        programs.umbriel = {
          enable = true;

          package = self'.packages.umbriel;
          portalPackage = self'.packages.xdg-desktop-portal-umbriel;
        };
      };

    homeManager =
      {
        inputs,
        osConfig,
        ...
      }:
      {
        imports = [
          inputs.umbriel.homeModules.default
        ];

        programs.umbriel = {
          inherit (osConfig.programs.umbriel)
            enable
            package
            ;
        };
      };
  };

  zen.flake-parts.default = {
    packages =
      {
        inputs',
        ...
      }:
      {
        umbriel = inputs'.umbriel.packages.default;
        xdg-desktop-portal-umbriel = inputs'.xdg-desktop-portal-umbriel.packages.default;
      };
  };
}
