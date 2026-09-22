{
  zen,
  ...
}:

{
  zen.games.supertuxkart = {
    description = ''
      best foss racing game
      it gave me very good expression
    '';

    meta = {
      package = pkgs: pkgs.supertuxkart;
    };

    wiki = {
      "SuperTuxKart" = {
        links = [
          {
            name = "main-page";
            link = "https://supertuxkart.net";
            logo = "https://supertuxkart.net/assets/images/logo.png";
          }
        ];
      };
    };

    homeManagerNixos =
      {
        pkgs,
        lib,
        user,
        ...
      }:
      let
        meta = zen.games.supertuxkart.meta;
      in
      (lib.mkMerge [
        {
          home.packages = [
            (meta.package pkgs)
          ];
        }
        (lib.optionalAttrs (user.hasAspect zen.games.steam) {
          programs.steam.config.nonSteamApps = {
            "SuperTuxKart" = {
              target = meta.package pkgs;

              artwork = {
                cover = pkgs.fetchurl {
                  url = "https://cdn2.steamgriddb.com/thumb/27d2cb1a3963d82eec5cfddc21d15fd9.jpg";
                  sha256 = "sha256-EmO48QR43Bnz9/kjohR9unRoHj8DVTOs89iEUWX3wI8=";
                };

                header = pkgs.fetchurl {
                  url = "https://cdn2.steamgriddb.com/thumb/168f6513fd770f0a1e48666f60950251.jpg";
                  sha256 = "sha256-cktay3D7jqdK7SMKT9Q8wfza9c2c6ZLZnprvMZr15XQ=";
                };

                hero = pkgs.fetchurl {
                  url = "https://cdn2.steamgriddb.com/hero_thumb/7a618f5f08a5e60213f0a0ab717da9df.jpg";
                  sha256 = "sha256-evO51XQCVEnFLUGkeGp067RuLZG5UdhG3HnghjhitFc=";
                };

                icon = pkgs.fetchurl {
                  url = "https://cdn2.steamgriddb.com/icon_thumb/7a576629fef88f3e636afd33b09e8289.png";
                  sha256 = "sha256-njzkz9L0cvWH/RhrWf3mzMbJ7nnRvQgpbmqJyq8p8uQ=";
                };

                logo = pkgs.fetchurl {
                  url = "https://cdn2.steamgriddb.com/logo_thumb/462f5aa589fac92fa8d4cf3c9dff9798.png";
                  sha256 = "sha256-Gf7UjH5t3UZcE/NcdKlBaSZTkY3UlrjC/ncnyCjBSuk=";
                };
              };
            };
          };
        })
      ]);
  };
}
