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
          cfg = config.services.qbittorrent;
          savePath = "/media/torrents";
        in
        {
          persist.directories = [
            "/var/lib/qBittorrent"
            savePath
          ];

          environment.systemPackages = [ pkgs.own.qbittorrent-tui ];

          services = {
            qbittorrent = {
              enable = true;
              openFirewall = true;

              webuiPort = 8112;
              torrentingPort = 6881;

              serverConfig = {
                LegalNotice.Accepted = true;

                BitTorrent.Session = {
                  TempPathEnabled = true;
                  DefaultSavePath = savePath;
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
                  AuthSubnetWhitelistEnabled = true;
                  LocalHostAuth = false;
                  UseUPnP = true;
                  Username = lib.userName;
                  Password_PBKDF2 = "@ByteArray(zYghDjh/mF8Cfw98MObGbw==:KUACE4R/NKLtGopaVWs07bGFC//DTfdWP8yf2lAxxZ44LMY+KQ5zOaGMYEBmhPNOPXou422ujdthPrFYNgnFNA==)";
                  Address = "0.0.0.0"; # access for localhost without login
                };

                RSS.Session = {
                  EnableProcessing = true;
                  MaxArticlesPerFeed = 2000;
                  RefreshInterval = 10;
                };

                Network.Proxy = {
                  # INFO:
                  #
                  # px1.blockme.site:3128
                  # px2.blockme.site:3128
                  #
                  # https://rutracker.org/forum/viewtopic.php?t=5134313
                  HostnameLookupEnabled = true;
                  IP = "px1.blockme.site";
                  Port = 3128;
                  Type = "HTTP";
                };

                AutoRun = {
                  enabled = true;
                  program = "${lib.getExe pkgs.libnotify} -a qbitTorrent -i qbittorrent '%N finished in %D' -u critical";
                  /*
                    %N: Torrent name
                    %L: Category
                    %G: Tags (separated by comma)
                    %F: Content path (same as root path for multifile torrent)
                    %R: Root path (first torrent subdirectory path)
                    %D: Save path
                    %C: Number of files
                    %Z: Torrent size (bytes)
                    %T: Current tracker
                    %I: Info hash v1
                    %J: Info hash v2
                    %K: Torrent ID
                  */
                };
              };
            };

            caddy.virtualHosts =
              lib.genAttrs
                [
                  "${lib.hostName}.local"
                ]
                (_: {
                  extraConfig = ''
                    tls internal
                    redir /qbittorrent /qbittorrent/ 308
                    handle_path /qbittorrent/* {
                      reverse_proxy http://0.0.0.0:${toString cfg.webuiPort}
                    }
                  '';
                });
          };

          systemd.services.qbittorrent = {
            serviceConfig = {
              UMask = "0002"; # 775
            };
          };

          tmp.qbittorrent = {
            "${savePath}".d = {
              inherit (config.services.qbittorrent)
                user
                group
                ;

              mode = "0775";
            };
          };
        };
    };
}
