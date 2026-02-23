{
  flake =
    {
      partsConfig,
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

              package =
                # WARN:
                # dont forget to delete when will update
                pkgs.flood.overrideAttrs (old: {
                  version = "4.12.5";
                  src = pkgs.fetchFromGitHub {
                    owner = "jesec";
                    repo = "flood";
                    tag = "v${old.version}";
                    hash = "sha256-4lmP8RRHALN8XPKZEW2jfFzwPyux5H33rF3dYxJ9u/U=";
                  };
                });

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
                    tls internal
                    encode zstd gzip
                    reverse_proxy http://0.0.0.0:${toString port}
                  '';
                });
          };
        };
    };
}
