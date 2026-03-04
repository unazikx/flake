# INFO:
# best video player
#
# WARN:
# by default anime4k is enabled

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
              "application/mxf"
              "application/sdp"
              "application/smil"
              "application/streamingmedia"
              "application/vnd.apple.mpegurl"
              "application/vnd.ms-asf"
              "application/vnd.rn-realmedia"
              "application/vnd.rn-realmedia-vbr"
              "application/x-cue"
              "application/x-extension-m4a"
              "application/x-extension-mp4"
              "application/x-matroska"
              "application/x-mpegurl"
              "application/x-ogm"
              "application/x-ogm-video"
              "application/x-shorten"
              "application/x-smil"
              "application/x-streamingmedia"
              "video/3gp"
              "video/3gpp"
              "video/3gpp2"
              "video/avi"
              "video/divx"
              "video/dv"
              "video/fli"
              "video/flv"
              "video/mkv"
              "video/mp2t"
              "video/mp4"
              "video/mp4v-es"
              "video/mpeg"
              "video/msvideo"
              "video/ogg"
              "video/quicktime"
              "video/vnd.divx"
              "video/vnd.mpegurl"
              "video/vnd.rn-realvideo"
              "video/webm"
              "video/x-avi"
              "video/x-flc"
              "video/x-flic"
              "video/x-flv"
              "video/x-m4v"
              "video/x-matroska"
              "video/x-mpeg2"
              "video/x-mpeg3"
              "video/x-ms-afs"
              "video/x-ms-asf"
              "video/x-msvideo"
              "video/x-ms-wmv"
              "video/x-ms-wmx"
              "video/x-ms-wvxvideo"
              "video/x-ogm"
              "video/x-ogm+ogg"
              "video/x-theora"
              "video/x-theora+ogg"
            ];
          };
        };
    };
}
