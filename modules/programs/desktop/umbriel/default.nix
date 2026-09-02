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

    homeManager =
      {
        ...
      }:
      { };
  };

  zen.flake-parts.default = {
    packages =
      {
        inputs',
        ...
      }:
      {
        umbriel = inputs'.umbriel.packages.default;
      };
  };
}
