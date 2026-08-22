{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    matugen-nix = {
      type = "github";
      owner = "unazikx";
      repo = "matugen-nix";
      inputs.nixpkgs.follows = "nixpkgs";
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

          wallpaper = {
            prefer = "value";
            source = pkgs.fetchurl {
              url = "https://w.wallhaven.cc/full/og/wallhaven-ogl5z9.png";
              sha256 = "sha256-VvnBCulYtyVqJOQ5psLJyIvK8YffWPP8Stz9KgznGcY=";
            };
          };
        };
      };
  };
}
