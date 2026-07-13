{
  ...
}:

{
  zen.services.vaultwarden = {
    description = ''
      completly anonymous password manager
      use: Keyguard (android)
           rbw (linux)
           bitwarden addons (firefox)
    '';

    os =
      {
        lib,
        config,
        ...
      }:
      let
        cfg = config.services.vaultwarden;
      in
      {
        services.vaultwarden = {
          enable = true;

          config = {
            rocketAddress = "0.0.0.0";
            rocketPort = 8311;

            signupsAllowed = true;
            invitationsAllowed = false;
            webVaultEnabled = true;

            dataFolder = lib.mkDefault "/var/lib/vaultwarden";
          };

          environmentFile = config.sops.secrets."services/vaultwarden".path;
          domain = "vault.${lib.hostName}.local";
        };

        systemd.services.vaultwarden.serviceConfig = {
          StateDirectory = lib.mkForce (baseNameOf cfg.config.dataFolder);
        };

        networking.firewall."allowedTCPPorts" = [ cfg.config.rocketPort ];

        services.caddy.virtualHosts =
          lib.genAttrs
            [
              "vaultwarden.${lib.hostName}.local"
            ]
            (_: {
              extraConfig = ''
                encode zstd gzip
                reverse_proxy http://${cfg.config.rocketAddress}:${toString cfg.config.rocketPort}
              '';
            });

        sops.secrets."services/vaultwarden" = {
          reloadUnits = [ "vaultwarden.service" ];
        };
      };
  };
}
