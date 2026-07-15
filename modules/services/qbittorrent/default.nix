{
  ...
}:

{
  zen.services.qbittorrent = {
    description = ''
      best torrent client

      services.qbittorrent.serverConfig = {
        BitTorrent.Session.DefaultSavePath = lib.mkDefault "...";
      };
      use for override download dir ^^^
    '';

    os =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.services.qbittorrent;
      in
      {
        services.qbittorrent = {
          enable = true;
          openFirewall = true;

          webuiPort = 8112;
          torrentingPort = 6881;

          serverConfig = {
            LegalNotice.Accepted = true;

            BitTorrent.Session = {
              TempPathEnabled = true;
              DefaultSavePath = lib.mkDefault "/media/torrents";
              QueueingSystemEnabled = true;
              IgnoreSlowTorrentsForQueueing = true;
              SlowTorrentsDownloadRate = 40; # kbps
              SlowTorrentsUploadRate = 40; # kbps
              GlobalMaxInactiveSeedingMinutes = 43800;
              GlobalMaxSeedingMinutes = 10080;
              GlobalMaxRatio = 2;
              MaxActiveCheckingTorrents = 2;
              MaxActiveDownloads = 5;
              MaxActiveUploads = 15;
              MaxActiveTorrents = 20;
              MaxConnections = 600;
              MaxUploads = 200;
            };

            Preferences.WebUI = {
              Enabled = true;
              Address = "0.0.0.0"; # access for localhost without login
              AuthSubnetWhitelistEnabled = true;
              LocalHostAuth = false;
              UseUPnP = true;
              Username = config.sops.placeholder."services/qbittorrent/username";
              Password_PBKDF2 = config.sops.placeholder."services/qbittorrent/password";
            };

            RSS.Session = {
              EnableProcessing = true;
              MaxArticlesPerFeed = 2000;
              RefreshInterval = 10;
            };

            Network.Proxy = {
              # INFO:
              # px1.blockme.site:3128
              # px2.blockme.site:3128
              # https://rutracker.org/forum/viewtopic.php?t=5134313
              HostnameLookupEnabled = true;
              IP = "px1.blockme.site";
              Port = 3128;
              Type = "HTTP";
            };
          };
        };

        # WARN:
        # overrides writeText file by sops template
        systemd.services.qbittorrent = {
          restartTriggers = lib.optionals (cfg.serverConfig != { }) (lib.mkForce [ ]);
          serviceConfig.ExecStartPre = lib.mkIf (cfg.serverConfig != { }) (
            lib.mkForce ''
              CONFIG_PATH="${cfg.profileDir}/qBittorrent/config/qBittorrent.conf"
              rm -f $CONFIG_PATH
              ${lib.getExe' pkgs.coreutils "ln"} -s ${
                config.sops.templates."qbittorrent-config".path
              } $CONFIG_PATH
            ''
          );
        };

        sops.secrets."services/qbittorrent/username" = {
          reloadUnits = [ "qbittorrent.service" ];
        };

        sops.secrets."services/qbittorrent/password" = {
          reloadUnits = [ "qbittorrent.service" ];
        };

        sops.templates."qbittorrent-config" = {
          content = (lib.gendeepINI cfg.serverConfig);
        };
      };
  };
}
