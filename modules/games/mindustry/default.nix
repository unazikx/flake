# INFO:
# factory maker
# and tower defense, very cool

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
          ...
        }:
        {
          persist.user.directories = [
            ".local/share/Mindustry"
          ];

          hmPackages = [
            pkgs.mindustry
          ];

          hm.xdg.dataFile =
            (
              mods:
              lib.listToAttrs (
                map (
                  mod:
                  let
                    modName = lib.removeSuffix ".jar" (baseNameOf mod.url) + ".zip";
                  in
                  {
                    name = "Mindustry/mods/${modName}";
                    value.source = pkgs.runCommand modName { } ''
                      cp ${
                        pkgs.fetchurl {
                          inherit (mod)
                            url
                            sha256
                            ;
                        }
                      } $out
                    '';
                  }
                ) mods
              )
            )
              # example...
              # {
              #   url = "...";
              #   sha256 = "..."; # nix store prefetch-file url
              # }
              [
                rec {
                  version = "2.3.3";
                  url = "https://github.com/xpdustry/claj/releases/download/${version}/claj-client.jar";
                  sha256 = "sha256-WDzzfv4Bh9l6cMcf8QVNFETK+qX74PPN5AdbNWtcvRE=";
                }
              ];
        };
    };
}
