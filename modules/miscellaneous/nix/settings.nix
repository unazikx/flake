{
  ...
}:

{
  zen.miscellaneous.nix.settings = {
    os =
      {
        lib,
        config,
        ...
      }:
      {
        nix.settings = {
          warn-dirty = false;
          auto-optimise-store = true;
          builders-use-substitutes = true;

          max-jobs = 2;
          cores = 2;

          experimental-features = [
            "nix-command"
            "flakes"
          ];

          trusted-users = [ "@wheel" ];

          substituters = lib.mkForce [
            "https://mirror.yandex.ru/nixos"
            "https://install.determinate.systems"
            # keep-sorted start
            "https://freesmlauncher.cachix.org"
            "https://lunaislazier.cachix.org"
            "https://niri.cachix.org"
            "https://nix-gaming.cachix.org"
            "https://unmojang.cachix.org"
            "https://winapps.cachix.org"
            "https://xache.cachix.org"
            "https://ytsub.cachix.org"
            # keep-sorted end
          ];

          trusted-public-keys = lib.mkForce [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
            # keep-sorted start
            "freesmlauncher.cachix.org-1:Jcp5Q9wiLL+EDv8Mh7c6L9xGk+lXr7/otpKxMOuBuDs="
            "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
            "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
            "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
            "unmojang.cachix.org-1:OfHnbBNduZ6Smx9oNbLFbYyvOWSoxb2uPcnXPj4EDQY="
            "winapps.cachix.org-1:HI82jWrXZsQRar/PChgIx1unmuEsiQMQq+zt05CD36g="
            "xache.cachix.org-1:InoMKnvFvDh+J5gFNHN1mmUONxvYJqFImLJY8/bl9YA="
            "ytsub.cachix.org-1:+//b4AUWp/46hIbTHVLhCU+DIP7TowiUWzM6Hsn8Ryg="
            # keep-sorted end
          ];
        };

        environment.sessionVariables = {
          CACHIX_AUTH_TOKEN = "$(cat ${config.sops.secrets."programs/cachix".path})";
          GITHUB_TOKEN = "$(cat ${config.sops.secrets."programs/github".path})";
        };

        sops.secrets."programs/cachix" = { };
        sops.secrets."programs/github" = { };
      };
  };
}
