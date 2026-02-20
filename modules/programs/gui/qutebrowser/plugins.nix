{
  pkgs,
  ...
}:

with pkgs;

[
  (fetchurl {
    url = "https://raw.githubusercontent.com/Frestein/dotfiles/dd86afd917806a12ca388d9e9250e4c800816e26/dot_config/private_qutebrowser/greasemonkey/Youtube-Sponsorblock.js";
    sha256 = "sha256-dJPPePmrVzm2fe0BJSaKuCORA7j2Tfly9STaegWWNDY=";
  })

  (fetchurl {
    url = "https://raw.githubusercontent.com/afreakk/greasemonkeyscripts/69df2b309eae2af18bb1d1ff1790f1d92d8e6a5d/youtube_adblock.js";
    sha256 = "sha256-AyD9VoLJbKPfqmDEwFIEBMl//EIV/FYnZ1+ona+VU9c=";
  })

  (fetchurl {
    url = "https://github.com/MALSync/MALSync/releases/download/0.12.2/malsync.user.js";
    sha256 = "sha256-r1ar8cqvsTjK/INyM0tq0zn/7qMmPe7UXxT0RPHzabU=";
  })

  (fetchurl {
    url = "https://github.com/MALSync/MALSync/releases/download/0.12.2/malsync-adult.user.js";
    sha256 = "sha256-xFjK7k1s3rVtJ5EYfUTQYB118cz0cP1O3FbTcsGq/ec=";
  })

  (fetchurl {
    url = "https://gist.githubusercontent.com/ilyhalight/6eb5bb4dffc7ca9e3c57d6933e2452f3/raw/7ab38af2228d0bed13912e503bc8a9ee4b11828d/gm-addstyle-polyfill.js";
    sha256 = "sha256-C4NkK3NGDV0XehzoStm0lTUVT6XUMy4app+vAFpxY0E=";
  })

  (fetchurl {
    url = "https://cdnjs.cloudflare.com/ajax/libs/hls.js/1.5.18/hls.light.min.js";
    sha256 = "sha256-dpILMwhk+cf2QUUaNHLhs0moVtpkzO84coRuKFlBgvk=";
  })
]
