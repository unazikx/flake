{
  zen,
  ...
}:

{
  zen.games.hytale = {
    description = ''
      official launcher for hytale
      built from zip archive instead flatpak
    '';

    wiki = {
      "Hytale Launcher".links = [
        {
          name = "nix-package-previous";
          link = "https://github.com/unazikx/hytale-launcher-nix";
          logo = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/hytale.png";
        }
      ];
    };

    meta = {
      package = pkgs: pkgs.hytale-launcher-wrapped;
    };

    homeManagerNixos =
      {
        self',
        pkgs,
        lib,
        user,
        ...
      }:
      let
        meta = zen.games.hytale.meta;
        json = pkgs.formats.json { };
      in
      (lib.mkMerge [
        {
          home.packages = [
            (meta.package self'.packages)
          ];

          xdg.dataFile = {
            "Hytale/settings.json".source = json.generate "hytale-settings.json" {
              disable_window_controls = true;
              language = "ru";
            };
          };
        }
        (lib.optionalAttrs (user.hasAspect zen.games.steam) {
          programs.steam.config.nonSteamApps = {
            "Hytale" = {
              target = meta.package self'.packages;
            };
          };
        })
      ]);
  };
}
