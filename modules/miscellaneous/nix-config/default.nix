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
        let
          caches = {
            # keep-sorted start block=yes newline_separated=yes
            "https://cache.nixos.asia/oss" = "oss:KO872wNJkCDgmGN3xy9dT89WAhvv13EiKncTtHDItVU=";

            "https://cache.nixos.org" = "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=";

            "https://freesmlauncher.cachix.org" =
              "freesmlauncher.cachix.org-1:Jcp5Q9wiLL+EDv8Mh7c6L9xGk+lXr7/otpKxMOuBuDs=";

            "https://lunaislazier.cachix.org" =
              "lunaislazier.cachix.org-1:q7P10Pw4WxSI1GVhtdM9gp/jk7BybuLJKfeNx3XCvWE=";

            "https://mirror.yandex.ru/nixos" = "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=";

            "https://niri.cachix.org" = "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964=";

            "https://nix-gaming.cachix.org" =
              "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=";

            "https://unmojang.cachix.org" =
              "unmojang.cachix.org-1:OfHnbBNduZ6Smx9oNbLFbYyvOWSoxb2uPcnXPj4EDQY=";

            "https://watersucks.cachix.org" =
              "watersucks.cachix.org-1:6gadPC5R8iLWQ3EUtfu3GFrVY7X6I4Fwz/ihW25Jbv8=";

            "https://winapps.cachix.org" = "winapps.cachix.org-1:HI82jWrXZsQRar/PChgIx1unmuEsiQMQq+zt05CD36g=";

            "https://xache.cachix.org" = "xache.cachix.org-1:InoMKnvFvDh+J5gFNHN1mmUONxvYJqFImLJY8/bl9YA=";
            # keep-sorted end
          };
        in
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

              substituters = lib.attrNames caches;
              trusted-public-keys = lib.attrValues caches;
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
