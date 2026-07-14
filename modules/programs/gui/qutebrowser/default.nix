{
  zen,
  ...
}:

{
  zen.programs.gui.qutebrowser = {
    description = ''
      ~~VERY UNSTABLE BROWSER~~

      okay its began stable
      very much shizocode
    '';

    includes = [
      zen.programs.gui.qutebrowser.bindings
      zen.programs.gui.qutebrowser.quickmarks
      zen.programs.gui.qutebrowser.rules
      zen.programs.gui.qutebrowser.settings
      zen.programs.gui.qutebrowser.theme
      zen.programs.gui.qutebrowser.userstyles
    ];

    homeManager =
      {
        pkgs,
        lib,
        ...
      }:
      {
        programs.qutebrowser = {
          enable = true;

          package = pkgs._previous.qutebrowser;

          searchEngines = {
            DEFAULT = "https://www.google.com/search?q={}";
          };

          greasemonkey = [
            (pkgs.fetchurl {
              url = "https://raw.githubusercontent.com/Frestein/dotfiles/dd86afd917806a12ca388d9e9250e4c800816e26/dot_config/private_qutebrowser/greasemonkey/Youtube-Sponsorblock.js";
              sha256 = "sha256-dJPPePmrVzm2fe0BJSaKuCORA7j2Tfly9STaegWWNDY=";
            })
            (pkgs.fetchurl {
              url = "https://raw.githubusercontent.com/afreakk/greasemonkeyscripts/69df2b309eae2af18bb1d1ff1790f1d92d8e6a5d/youtube_adblock.js";
              sha256 = "sha256-AyD9VoLJbKPfqmDEwFIEBMl//EIV/FYnZ1+ona+VU9c=";
            })
            (pkgs.fetchurl {
              url = "https://github.com/MALSync/MALSync/releases/download/0.12.2/malsync.user.js";
              sha256 = "sha256-r1ar8cqvsTjK/INyM0tq0zn/7qMmPe7UXxT0RPHzabU=";
            })
            (pkgs.fetchurl {
              url = "https://github.com/MALSync/MALSync/releases/download/0.12.2/malsync-adult.user.js";
              sha256 = "sha256-xFjK7k1s3rVtJ5EYfUTQYB118cz0cP1O3FbTcsGq/ec=";
            })
            (pkgs.fetchurl {
              url = "https://gist.githubusercontent.com/ilyhalight/6eb5bb4dffc7ca9e3c57d6933e2452f3/raw/7ab38af2228d0bed13912e503bc8a9ee4b11828d/gm-addstyle-polyfill.js";
              sha256 = "sha256-C4NkK3NGDV0XehzoStm0lTUVT6XUMy4app+vAFpxY0E=";
            })
            (pkgs.fetchurl {
              url = "https://cdnjs.cloudflare.com/ajax/libs/hls.js/1.5.18/hls.light.min.js";
              sha256 = "sha256-dpILMwhk+cf2QUUaNHLhs0moVtpkzO84coRuKFlBgvk=";
            })
          ];
        };

        home.packages = [
          pkgs.python312Packages.adblock
          pkgs.python312Packages.requests
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
        ] (_: [ "org.qutebrowser.qutebrowser.desktop" ]);

        xdg.mimeApps.defaultApplications = {
          "text/html" = "org.qutebrowser.qutebrowser.desktop";
          "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
          "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
          "x-scheme-handler/chrome" = "org.qutebrowser.qutebrowser.desktop";
          "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
          "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
        };
      };
  };
}
