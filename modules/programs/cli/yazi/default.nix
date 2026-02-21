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
                  djvulibre
                  ffmpegthumbnailer
                  glow
                  imagemagick
                  jq
                  p7zip-rar
                  transmission_4
                  wl-clipboard
                  ouch
                  ;

                # ouch = pkgs.ouch.override { enableUnfree = true; };
              };
            }
            // (import ./settings/main.nix {
              inherit
                pkgs
                lib
                config
                ;
            });

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
