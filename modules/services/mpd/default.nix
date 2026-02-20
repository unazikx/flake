{
  flake =
    {
      partsConfig,
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          config,
          ...
        }:
        let
          cfg = config.hm.services.mpd;

          inherit (config.hm.services.syncthing.settings)
            devices
            ;
        in
        {
          imports = lib.attrValues {
            inherit (partsConfig.nixosModules)
              ncmpcpp
              ;
          };

          hm.services = {
            mpd = {
              enable = true;
              # music dir as default is xdg music

              extraConfig = ''
                auto_update "yes"

                audio_output {
                  type   "fifo"
                  name   "MPD Visualizer"
                  format "44100:16:2"
                  path   "${cfg.dataDir}/visualizer.fifo"
                }

                audio_output {
                  type "pipewire"
                  name "MPD PipeWire"
                }
              '';

              network = {
                startWhenNeeded = true;
              };
            };

            mpd-mpris = {
              enable = true;

              mpd.useLocal = true;
            };

            mpdscribble = {
              enable = true;

              endpoints = {
                "last.fm" = {
                  passwordFile = config.sopsnix."services/lastfm";
                  username = "azikx6"; # cause azikx was taken already... eh...
                };
              };
            };

            mpd-discord-rpc = {
              enable = true;

              settings = {
                hosts = [
                  (lib.concatStringsSep ":" [
                    cfg.network.listenAddress
                    (toString cfg.network.port)
                  ])
                ];

                format = {
                  details = "$title ($$duration)";
                  state = "$artist / $album ($date)";
                  large_image = "url";
                  small_image = "url";
                };
              };
            };

            syncthing.settings.folders = lib.listToAttrs [
              (lib.syncthing.mkFolder {
                name = "music";
                id = "wfufr6w4fr7dyuhe";
                path = "${config.hm.xdg.userDirs.music}";
                devices = lib.syncthing.mkFilter devices [
                  "windauser"
                ];
              })
            ];
          };
        };
    };
}
