# INFO:
# minecraft clients via nix
# idk broken
/*
  ❯ nixos-rebuild switch --flake $XDG_FLAKE_DIR#pcRyazenka
  building the system configuration...
  error (ignored): opening directory "/nix/store": Too many open files
  error (ignored): opening directory "/nix/var/nix/builds": Too many open files
  error: opening directory "/nix/store": Too many open files
*/

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
          hm.nixcraft = {
            enable = true;

            client = lib.mkMerge [
              {
                shared = {
                  enable = true;

                  files = {
                    "screenshots".source =
                      config.hm.lib.file.mkOutOfStoreSymlink config.hm.xdg.userDirs.extraConfig.SCREENSHOTS;
                  };

                  account = {
                    username = "_azikx";
                    uuid = "e6074fe1-b0d5-4394-a860-c84987c52d9a";
                    offline = false;
                  };
                };
              }
              {
                instances =
                  # https://minecraft.wiki/w/Category:Java_Edition_versions
                  # https://minecraft.wiki/w/Category:Java_Edition_snapshots
                  {
                    "Herdcraft Update" = {
                      version = "26w14a";
                      desktopEntry.enable = true;

                      java = {
                        package = pkgs.temurin-bin-25;

                        maxMemory = 8192;
                        minMemory = 512;
                      };
                    };
                  };
              }
            ];
          };
        };
    };
}
