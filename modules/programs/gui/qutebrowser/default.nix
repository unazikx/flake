# WARN: !!!!!!
# VERY VERY UNSTABLE BROWSER
#
# INFO:
# if u cant login Google use this
# :set -u https://accounts.google.com/* content.headers.user_agent "Mozilla/5.0 ({os_info}; rv:135.0) Gecko/20100101 Firefox/135"
# it should be by default
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
          persist.user.directories = [ ".local/share/qutebrowser" ];

          hmPackages = with pkgs.python312Packages; [
            adblock
            requests
          ];

          hm = {
            imports = [ ./whlist.nix ];

            programs.qutebrowser = lib.mkMerge [
              {
                enable = true;
                package = pkgs.qutebrowser;

                searchEngines = {
                  DEFAULT = "https://www.google.com/search?q={}";
                  _4get = "https://4get.nadeko.net/web?s={}";
                };

                keyBindings = import ./binds.nix {
                  inherit
                    pkgs
                    lib
                    ;
                };
              }
              (import ./settings.nix {
                inherit
                  pkgs
                  lib
                  config
                  ;
              })
            ];

            xdg.mimeApps.associations.removed = lib.genAttrs [
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
            ] (_n: [ "org.qutebrowser.qutebrowser.desktop" ]);
          };

          hmMime = lib.mkMime {
            "org.qutebrowser.qutebrowser.desktop" = [
              "text/html"
              "x-scheme-handler/http"
              "x-scheme-handler/https"
              "x-scheme-handler/chrome"
              "x-scheme-handler/about"
              "x-scheme-handler/unknown"
            ];
          };
        };
    };
}
