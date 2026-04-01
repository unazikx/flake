# INFO:
# generate warp configs here
# https://warp-mirrors.vercel.app (hub)
# https://warp2.llimonix.pw (website for warp generate)
# https://warp_generator_bot.t.me (good tg bot for warp)
#
# INFO:
# create ./connection.conf and fill it
#
# > git add --intent-to-add ./<name>.conf
# > git update-index --skip-worktree --assume-unchanged ./<name>.conf
#
# or create secret file via sopsnix/agenix
# like "vpn/amneziawg/<name>"
#
# rebuild

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        {
          environment = {
            etc =
              let
                generateFromSopsSecrets = lib.mapAttrs' (
                  sopsPath: source:
                  let
                    name = lib.last (lib.splitString "/" sopsPath);
                  in
                  lib.nameValuePair "amnezia/amneziawg/${name}.conf" {
                    inherit
                      source
                      ;
                  }
                ) (lib.filterAttrs (path: _: lib.hasPrefix "vpn/amneziawg/" path) (config.sopsnix or { }));

                generateFromSubDirectory = lib.listToAttrs (
                  map (
                    file:
                    let
                      name = baseNameOf file;
                    in
                    {
                      name = "amnezia/amneziawg/${name}";
                      value.source = ./${name};
                    }
                  ) (lib.filter (f: lib.match ".*\\.conf$" f != null) (lib.attrNames (builtins.readDir ./.)))
                );
              in
              lib.mkMerge [
                generateFromSopsSecrets
                generateFromSubDirectory
              ];

            systemPackages = lib.attrValues {
              inherit (pkgs)
                amneziawg-tools
                amneziawg-go
                ;
            };
          };

          boot.extraModulePackages = [
            (config.boot.kernelPackages.amneziawg.overrideAttrs (_old: {
              version = "1.0.20260322";
              src = pkgs.fetchFromGitHub {
                owner = "amnezia-vpn";
                repo = "amneziawg-linux-kernel-module";
                tag = "v${_old.version}";
                hash = "sha256-Y6TETOo5oAr3ZtqsJX909zm38rXq+1fAXiRFSt+g2Gw=";
              };
            }))
          ];
        };
    };
}
