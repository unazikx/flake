{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.services.flood;
in

{
  disabledModules = [ "services/torrent/flood.nix" ];

  options = {
    services.flood = {
      enable = lib.mkEnableOption "flood";
      package = lib.mkPackageOption pkgs "flood" { };
      openFirewall = lib.mkEnableOption "" // {
        description = "Whether to open the firewall for the port in {option}`services.flood.port`.";
      };

      port = lib.mkOption {
        type = lib.types.int;
        description = "Port to bind webserver.";
        default = 3000;
        example = 3001;
      };

      host = lib.mkOption {
        type = lib.types.str;
        description = "Host to bind webserver.";
        default = "localhost";
        example = "::";
      };

      runDir = lib.mkOption {
        type = lib.types.str;
        description = "Directory where will be storage config and db.";
        default = "/var/lib/flood";
      };

      extraArgs = lib.mkOption {
        type = with lib.types; listOf str;
        description = "Extra arguments passed to `flood`.";
        default = [ ];
        example = [ "--baseuri=/" ];
      };
    };
  };

  config = {
    systemd.services.flood = {
      path = [ pkgs.mediainfo ];

      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "simple";

        DynamicUser = true;
        LockPersonality = true;
        NoNewPrivileges = true;
        PrivateDevices = true;
        PrivateTmp = true;
        ProtectClock = true;
        ProtectControlGroups = true;
        ProtectHome = true;
        ProtectHostname = true;
        ProtectKernelLogs = true;
        ProtectKernelModules = true;
        ProtectKernelTunables = true;

        StateDirectory = [ (baseNameOf cfg.runDir) ];
        StateDirectoryMode = lib.mkDefault 775;

        ExecStart = lib.concatStringsSep " " (
          [
            (lib.getExe cfg.package)
            "--rundir ${cfg.runDir}"
            "--host ${cfg.host}"
            "--port ${toString cfg.port}"
          ]
          ++ cfg.extraArgs
        );
      };
    };

    networking.firewall = lib.mkIf cfg.openFirewall (
      lib.genAttrs [
        "allowedTCPPorts"
        "allowedTCPPorts"
      ] (_: [ cfg.port ])
    );

    users = {
      groups.flood = { };

      users.flood = {
        isSystemUser = true;

        group = "flood";
      };
    };
  };
}
