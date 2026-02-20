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
          hm = {
            programs.yazi = {
              enable = true;

              extraPackages = lib.attrValues {
                inherit (pkgs)
                  ffmpegthumbnailer
                  glow
                  jq
                  wl-clipboard
                  ;

                ouch = pkgs.ouch.override { enableUnfree = true; };
              };

              keymap = import ./binds.nix {
                inherit
                  pkgs
                  lib
                  config
                  ;
              };

              initLua = import ./lua.nix {
                inherit
                  config
                  ;
              };

              theme = import ./theme.nix {
                inherit
                  lib
                  config
                  ;
              };
            }
            // import ./plugins.nix {
              inherit
                pkgs
                ;
            }
            // import ./settings/main.nix {
              inherit
                lib
                config
                ;
            };

            xdg.mimeApps = {
              defaultApplications = {
                "inode/directory" = [ "yazi.desktop" ];
                "inode/mount-point" = [ "yazi.desktop" ];
              };
            };
          };
        };
    };
}
