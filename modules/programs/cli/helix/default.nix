{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          self,
          pkgs,
          lib,
          config,
          ...
        }:
        {
          hm = {
            home.shellAliases.e = "$EDITOR"; # cause defaultEditor

            programs.helix = {
              enable = true;

              defaultEditor = true;

              settings = (import ./settings.nix) // {
                theme = "themo";
              };
            }
            // {
              themes = import ./theme.nix {
                inherit
                  lib
                  config
                  ;
              };

              languages = import ./languages.nix {
                inherit
                  self
                  pkgs
                  lib
                  ;
              };
            };
          };

          hmMime = lib.mkMime {
            "Helix.desktop" = [
              "inode/empty"
              "text/*"
              "application/*"
            ];
          };
        };
    };
}
