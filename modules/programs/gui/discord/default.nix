# INFO:
# discord modded client

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          config,
          ...
        }:
        {
          persist.user.directories = [
            ".config/equibop"
          ];

          hm.programs.nixcord = {
            enable = true;

            inherit (config.hm.home) homeDirectory;
            xdgConfigHome = config.hm.xdg.configHome;

            discord.enable = false; # why?

            vesktop.enable = true; # equibop is newgen vesktop
            vesktopConfig = import ./settings.nix {
              inherit
                lib
                config
                ;
            };
          };

          hmMime = lib.mkMime {
            "equibop.desktop" = [ "x-scheme-handler/discord" ];
          };
        };
    };
}
