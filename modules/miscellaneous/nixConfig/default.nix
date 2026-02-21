{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          inputs,
          pkgs,
          lib,
          config,
          ...
        }:
        {
          persist.directories = [
            "/etc/nixos"
          ];

          environment.systemPackages = with pkgs; [
            hydra-check
            own.hasher
          ];

          nix = {
            package = pkgs.nix;

            registry =
              (lib.mapAttrs (
                _: v: {
                  flake = v;
                }
              ))
                (lib.filterAttrs (_: v: lib.isType "flake" v) inputs);

            settings = {
              warn-dirty = false;
              auto-optimise-store = true;
              download-buffer-size = (512 * 1000000);

              experimental-features = [
                "pipe-operators"
                "nix-command"
                "flakes"
              ];

              trusted-users = [
                lib.userName
                "@wheel"
              ];

              substituters = lib.mkForce [
                "https://mirror.yandex.ru/nixos"
                "https://niri.cachix.org"
                "https://nix-gaming.cachix.org"
                "https://unmojang.cachix.org"
                "https://winapps.cachix.org"
                "https://xache.cachix.org"
              ];

              trusted-public-keys = [
                "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
                "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
                "unmojang.cachix.org-1:OfHnbBNduZ6Smx9oNbLFbYyvOWSoxb2uPcnXPj4EDQY="
                "winapps.cachix.org-1:HI82jWrXZsQRar/PChgIx1unmuEsiQMQq+zt05CD36g="
                "xache.cachix.org-1:InoMKnvFvDh+J5gFNHN1mmUONxvYJqFImLJY8/bl9YA="
              ];
            };

            # INFO: from secret as
            #
            # > githubToken.age | githubToken.yaml
            # access-tokens = github.com=23ac...b289
            extraOptions = ''
              !include ${config.sopsnix."tokens/github"}
            '';
          };
        };
    };
}
