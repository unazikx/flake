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

            discord.enable = false; # why?
            equibop.enable = true; # equibop is newgen vesktop

            equibopConfig = import ./settings.nix {
              inherit
                lib
                config
                ;
            };
          };

          hmMime = lib.mkMime {
            "vesktop.desktop" = [ "x-scheme-handler/discord" ];
          };
        };
    };
}
