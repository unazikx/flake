{
  lib,
  ...
}:

{
  zen.miscellaneous.nix.substituters =
    lib.genAttrs
      [
        "os"
        "homeManager"
      ]
      (_: {
        nix.settings = {
          substituters = lib.mkForce [
            "https://mirror.yandex.ru/nixos"
            "https://install.determinate.systems"
            # keep-sorted start
            "https://niri.cachix.org"
            "https://nix-gaming.cachix.org"
            "https://vicinae.cachix.org"
            "https://xache.cachix.org"
            # keep-sorted end
          ];

          trusted-public-keys = lib.mkForce [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
            # keep-sorted start
            "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
            "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
            "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
            "xache.cachix.org-1:InoMKnvFvDh+J5gFNHN1mmUONxvYJqFImLJY8/bl9YA="
            # keep-sorted end
          ];
        };
      });
}
