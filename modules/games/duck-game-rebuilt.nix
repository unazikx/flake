{
  zen,
  ...
}:

{
  zen.games.duck-game-rebuilt = {
    description = ''
      decompiled Duck Game with extra features
    '';

    meta = {
      package = pkgs: pkgs.duck-game-rebuilt-wrapped;
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
        meta = zen.games.duck-game-rebuilt.meta;
      in
      (lib.mkMerge [
        {
          home.packages = [
            (meta.package self'.packages)
          ];
        }
        (lib.optionalAttrs (user.hasAspect zen.games.steam) {
          programs.steam.config.nonSteamApps = {
            "Duck Game Rebuilt" = {
              target = meta.package self'.packages;

              artwork = {
                cover = pkgs.fetchurl {
                  url = "https://cdn2.steamgriddb.com/thumb/8890f0afdc2d4bc1749eb1774e818436.png";
                  sha256 = "sha256-bi62oigArkjwpEfWlnAN6mc27RCiJZa8/fNQUPhris4=";
                };

                header = pkgs.fetchurl {
                  url = "https://cdn2.steamgriddb.com/thumb/0d76844016babda30f99909e72cbd692.jpg";
                  sha256 = "sha256-8WjVpLAeQmkGnZZoc3E7U6L/tHT3a/PUoRji/r12Akk=";
                };

                hero = pkgs.fetchurl {
                  url = "https://cdn2.steamgriddb.com/hero_thumb/282f3a0cee1b0a724ccab671ee4cb03b.jpg";
                  sha256 = "sha256-MEKU8VePEiWRu+RWajoEySnkw9UG3jBgzamiS+oyoMc=";
                };

                icon = pkgs.fetchurl {
                  url = "https://cdn2.steamgriddb.com/icon_thumb/5fb4b3aec6d1fe7ac39d72fc3fbb2175.png";
                  sha256 = "sha256-jmHXiwdOuQjDHPuIDzD3nxO+x+1fNDlUsojyS+hztGc=";
                };

                logo = pkgs.fetchurl {
                  url = "https://cdn2.steamgriddb.com/logo_thumb/8750cece0f8b031d0df80ea8d1345d01.png";
                  sha256 = "sha256-6jk9uqdFwJyc67FEt0VLAkQ+iec3sASXzUaa16fUOBg=";
                };
              };
            };
          };
        })
      ]);
  };
}
