{
  ...
}:

{
  zen.games.hytale.launcher = {
    description = ''
      official launcher for hytale
      built from zip archive instead flatpak
    '';

    wiki = {
      "Hytale Launcher".links = [
        {
          name = "nix-package-previous";
          url = "https://github.com/unazikx/hytale-launcher-nix";
          logo = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/hytale.png";
        }
      ];
    };

    homeManagerNixos =
      {
        self',
        pkgs,
        ...
      }:
      let
        json = pkgs.formats.json { };
      in
      {
        home.packages = [
          self'.packages.hytale-launcher-wrapped
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
