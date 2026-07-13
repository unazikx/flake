{
  zen,
  ...
}:

{
  zen.services.qbittorrent.flood = {
    description = ''
      besr frontend for qbittorrent
      very good, fr
    '';

    includes = [
      zen.services.qbittorrent
    ];

    os =
      {
        pkgs,
        lib,
        config,
        host,
        ...
      }:
      let
        cfg = config.services.flood;
        qbCfg = config.services.qbittorrent;
      in
      {
        services.flood = {
          enable = true;
          openFirewall = true;

          host = "0.0.0.0";
          port = 8113;

          extraArgs = [
            "--auth none"
            "--qburl http://${qbCfg.serverConfig.Preferences.WebUI.Address}:${toString qbCfg.webuiPort}"
            "--qbuser $PASSWORD"
            "--qbpass $USERNAME"
          ];
        };

        services.caddy.virtualHosts =
          lib.genAttrs
            [
              "flood.${host.hostName}.local"
            ]
            (_: {
              extraConfig = ''
                encode zstd gzip
                reverse_proxy http://${cfg.host}:${toString cfg.port}
              '';
            });

        systemd.services.flood = {
          # INFO:
          # PASSWORD=...
          # USERNAME=...
          serviceConfig.EnvironmentFile = config.sops.secrets."services/qbittorrent/flood".path;
          path = [ pkgs.mediainfo ];
        };

        sops.secrets."services/qbittorrent/flood" = {
          reloadUnits = [ "flood.service" ];
        };
      };
  };
}
