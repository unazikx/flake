# INFO:
# besr frontend for qbittorrent
# very good, fr

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
          port = 8113;
          cfg = config.services.qbittorrent;
        in
        {
          imports =
            (lib.attrValues {
              inherit (partsConfig.nixosModules)
                qbittorrent
                ;
            })
            ++ [ ./module.nix ];

          persist.directories = [ "/var/lib/flood" ];

          services = {
            flood = {
              enable = true;
              openFirewall = true;

              host = "0.0.0.0";
              port = 8113;

              extraArgs = [
                "--auth none"
                "--qburl http://${cfg.serverConfig.Preferences.WebUI.Address}:${toString cfg.webuiPort}"
                "--qbuser ${lib.userName}"
                "--qbpass simplepassword"
              ];
            };

            caddy.virtualHosts =
              lib.genAttrs
                [
                  "flood.${lib.hostName}.local"
                ]
                (_: {
                  extraConfig = ''
                    encode zstd gzip
                    reverse_proxy http://0.0.0.0:${toString port}
                  '';
                });
          };
        };
    };
}
