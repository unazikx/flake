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
        {
          persist.user.directories = [ ".local/share/PrismLauncher" ];

          hmPackages = [ pkgs.prismlauncher ];

          networking.firewall = lib.genAttrs [
            "allowedTCPPorts"
            "allowedUDPPorts"
          ] (n: [ 25565 ]);

          hm.xdg.dataFile = {
            "PrismLauncher/prismlauncher.cfg".source = (
              import ./settings.nix {
                inherit
                  pkgs
                  lib
                  config
                  ;
              }
            );
          };

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
