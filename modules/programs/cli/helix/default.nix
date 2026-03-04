# INFO:
# best out-from-box text editor
# i made alias 'e' it is '$EDITOR'

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
              "application/json"
              "application/xml"
              "application/x-shellscript"
              "application/x-subrip"
              "inode/directory"
              "inode/empty"
              "text/css"
              "text/csv"
              "text/english"
              "text/html"
              "text/markdown"
              "text/plain"
              "text/vnd.trolltech.linguist"
              "text/x-c"
              "text/x-c++"
              "text/x-c++hdr"
              "text/x-c++src"
              "text/x-chdr"
              "text/x-csrc"
              "text/x-java"
              "text/x-makefile"
              "text/xml"
              "text/x-moc"
              "text/x-pascal"
              "text/x-tcl"
              "text/x-tex"
            ];
          };
        };
    };
}
