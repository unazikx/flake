# INFO:
# best image viewer
# with gallery vies
# glitches on niri?

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
          hm.programs.swayimg = {
            enable = true;

            settings = import ./settings.nix {
              inherit
                config
                ;
            };
          };

          hmMime = lib.mkMime {
            "swayimg.desktop" = [
              "image/avif"
              "image/gif"
              "image/heif"
              "image/jpg"
              "image/jpeg"
              "image/jxl"
              "image/png"
              "image/bmp"
              "image/x-eps"
              "image/x-icns"
              "image/x-ico"
              "image/x-portable-bitmap"
              "image/x-portable-graymap"
              "image/x-portable-swayimgmap"
              "image/x-xbitmap"
              "image/x-xswayimgmap"
              "image/tiff"
              "image/x-psd"
              "image/x-webp"
              "image/webp"
              "image/x-tga"
              "image/svg+xml"
            ];
          };
        };
    };
}
