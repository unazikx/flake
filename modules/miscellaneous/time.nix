{
  ...
}:

{
  zen.miscellaneous.time = {
    nixos =
      {
        pkgs,
        lib,
        config,
        options,
        ...
      }:
      {
        services = {
          chrony.enable = true;
        };

        networking.timeServers = lib.flatten [
          options.networking.timeServers.default
          "0.ru.pool.ntp.org"
          "1.ru.pool.ntp.org"
          "2.ru.pool.ntp.org"
          "3.ru.pool.ntp.org"
        ];

        systemd.services = {
          set-timezone = {
            wantedBy = [ "multi-user.target" ];
            after = [ "network.target" ];

            serviceConfig = {
              Type = "oneshot";
              RemainAfterExit = true;
            };

            script = ''
              TIMEZONE=$(${lib.getExe' pkgs.coreutils "cat"} ${config.sops.secrets."timezone".path})
              ${lib.getExe' config.systemd.package "timedatectl"} set-timezone "$TIMEZONE"
            '';
          };
        };

        sops.secrets = {
          "timezone" = { };
        };
      };
  };
}
