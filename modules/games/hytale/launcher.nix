{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    hytale-launcher = {
      type = "github";
      owner = "unazikx";
      repo = "hytale-launcher-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.games.hytale.launcher = {
    description = ''
      official launcher for hytale
      built from zip archive instead flatpak
    '';

    wiki = {
      "Hytale Launcher".links = [
        # keep-sorted start block=yes
        {
          name = "nix-package";
          url = "https://github.com/unazikx/hytale-launcher-nix";
        }
        # keep-sorted end
      ];
    };

    homeManagerNixos =
      {
        inputs',
        pkgs,
        ...
      }:
      let
        json = pkgs.formats.json { };
      in
      {
        home.packages = [
          inputs'.hytale-launcher.packages.hytale-launcher
        ];

        xdg.dataFile = {
          "Hytale/settings.json".source = json.generate "hytale-settings.json" {
            disable_window_controls = true;
            language = "ru";
          };
        };
      };
  };
}
