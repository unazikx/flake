# INFO:
# added registry bases on inputs
# and overlays

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
            package = pkgs.lixPackageSets.stable.lix;

            registry =
              let
                isFlake = (_: entry: lib.isType "flake" entry);
              in
              (lib.mapAttrs (
                _: flake: {
                  inherit
                    flake
                    ;
                }
              ))
                (lib.filterAttrs isFlake inputs);

            settings = {
              warn-dirty = false;
              auto-optimise-store = true;

              experimental-features = [
                "nix-command"
                "flakes"
              ];

              trusted-users = [
                lib.userName
                "@wheel"
              ];

              substituters = lib.mkForce [
                # keep-sorted start
                "https://cache.nixos.asia/oss"
                "https://freesmlauncher.cachix.org"
                "https://lunaislazier.cachix.org"
                "https://mirror.yandex.ru/nixos"
                "https://niri.cachix.org"
                "https://nix-gaming.cachix.org"
                "https://unmojang.cachix.org"
                "https://watersucks.cachix.org"
                "https://winapps.cachix.org"
                "https://xache.cachix.org"
                # keep-sorted end
              ];

              trusted-public-keys = [
                # keep-sorted start
                "freesmlauncher.cachix.org-1:Jcp5Q9wiLL+EDv8Mh7c6L9xGk+lXr7/otpKxMOuBuDs="
                "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
                "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
                "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
                "oss:KO872wNJkCDgmGN3xy9dT89WAhvv13EiKncTtHDItVU="
                "unmojang.cachix.org-1:OfHnbBNduZ6Smx9oNbLFbYyvOWSoxb2uPcnXPj4EDQY="
                "watersucks.cachix.org-1:6gadPC5R8iLWQ3EUtfu3GFrVY7X6I4Fwz/ihW25Jbv8="
                "winapps.cachix.org-1:HI82jWrXZsQRar/PChgIx1unmuEsiQMQq+zt05CD36g="
                "xache.cachix.org-1:InoMKnvFvDh+J5gFNHN1mmUONxvYJqFImLJY8/bl9YA="
                # keep-sorted end
              ];
            };

            # INFO: from secret as
            #
            # > githubToken.age | githubToken.yaml
            # access-tokens = github.com=23ac...b289
            extraOptions = ''
              !include ${config.sopstem."nixAccessTokens"}
            '';
          };

          nixpkgs.overlays = [
            (_f: p: {
              inherit (p.lixPackageSets.stable)
                # keep-sorted start
                colmena
                nix-eval-jobs
                nix-fast-build
                nixpkgs-review
                # keep-sorted end
                ;
            })
          ];

          system.build = {
            nixos-rebuild = lib.mkForce pkgs.own.nixos-rebuild;
          };

          sops.templates = {
            "nixAccessTokens" = {
              owner = lib.userName;
              content = ''
                access-tokens = github.com=${config.sopsplace."tokens/github"}
              '';
            };
          };
        };
    };
}
