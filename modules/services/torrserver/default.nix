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
          port = 8223;
          dir = "/var/lib/torrserver";
        in
        {
          persist.directories = [ dir ];

          systemd.services = {
            torrserver = {
              after = [ "network.target" ];

              wantedBy = [ "multi-user.target" ];

              serviceConfig = {
                Restart = "on-failure";
                Type = "simple";
                TimeoutSec = 30;

                User = "media";
                Group = "media";

                StateDirectory = [ "torrserver" ];
                StateDirectoryMode = lib.mkDefault 775;

                ExecStart = ''
                  ${lib.getExe pkgs.own.torrserver} \
                  -d /var/lib/torrserver \
                  -i 0.0.0.0"
                  -p ${toString port}
                '';
              };
            };
          };

          services.caddy.virtualHosts =
            lib.genAttrs
              [
                "${lib.hostName}.local"
              ]
              (_: {
                extraConfig = ''
                  tls internal
                  redir /torrserver /torrserver/ 308
                  handle_path /torrserver/* {
                    reverse_proxy http://0.0.0.0:${toString port}
                  }
                '';
              });

          tmp.qbittorrent = {
            "${dir}/temp".d = {
              user = "media";
              group = "media";
              mode = "0775";
            };

            "${dir}/settings.json"."L+" = {
              user = "media";
              group = "media";
              mode = "1400";
              argument = toString (
                (pkgs.formats.json { }).generate "torrserver-settings.json" {
                  BitTorr = {
                    CacheSize = 67108864;
                    ConnectionsLimit = 25;
                    DisableDHT = false;
                    DisablePEX = false;
                    DisableTCP = false;
                    DisableUPNP = false;
                    DisableUTP = false;
                    DisableUpload = false;
                    DownloadRateLimit = 0;
                    EnableDLNA = false;
                    EnableDebug = false;
                    EnableIPv6 = false;
                    EnableRutorSearch = false;
                    ForceEncrypt = false;
                    FriendlyName = "";
                    PeersListenPort = 0;
                    PreloadCache = 50;
                    ReaderReadAHead = 95;
                    ResponsiveMode = false;
                    RetrackersMode = 1;
                    TorrentDisconnectTimeout = 30;
                    TorrentsSavePath = "${dir}/temp";
                    UploadRateLimit = 0;
                  }
                  // (lib.genAttrs [
                    "UseDisk"
                    "RemoveCacheOnDrop"
                  ] (_: true));
                }
              );
            };
          };

          networking.firewall = {
            allowedTCPPorts = [ 8223 ];
          };
        };
    };
}
