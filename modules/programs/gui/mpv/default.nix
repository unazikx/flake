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
        let
          theme = import ./theme.nix {
            inherit
              config
              lib
              ;
          };
          settings = import ./settings.nix {
            inherit pkgs lib;
          };
        in
        {
          hm.programs.mpv = {
            enable = true;

            bindings = import ./bindings.nix;

            scripts = import ./scripts.nix {
              inherit
                pkgs
                ;
            };

            scriptOpts = settings.script // theme.uosc;

            config = settings.config // theme.conf;

            extraInput = settings.extra;
          };

          hmMime = lib.mkMime {
            "mpv.desktop" = [
              "video/*"
              "audio/*"
              "application/x-matroska"
            ];
          };
        };
    };
}
