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

      source:
      https://github.com/unazikx/hytale-launcher-nix
    '';

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
