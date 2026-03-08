# INFO:
# just play
# in ../../../services/minecraft/default.nix
# i have server, but tsss

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
        (import ../prism-generator.nix {
          inherit pkgs lib config;
          persistDir = ".local/share/PrismLauncher";
          configDir = "PrismLauncher/prismlauncher.cfg";
          package = pkgs.prismlauncher;
        })
        // {
          hmMime = lib.mkMime {
            "org.prismlauncher.PrismLauncher.desktop" = [
              "x-scheme-handler/prismlauncher"
              "x-scheme-handler/curseforge"
              "application/x-modrinth-modpack+zip"
              "application/zip"
            ];
          };
        };
    };
}
