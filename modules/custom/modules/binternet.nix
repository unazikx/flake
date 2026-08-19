{
  zen.custom.binternet = {
    nixos =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.services.binternet;
      in
      {
        options = {
          services.binternet = {
            enable = lib.mkEnableOption "Binternet";

            package = lib.mkPackageOption pkgs "binternet";

            openFirewall = lib.mkEnableOption "Open the firewall";

            port = lib.mkOption {
              type = lib.types.int;
              description = "Port to bind webserver.";
              default = 3000;
              example = 8080;
            };

            host = lib.mkOption {
              type = lib.types.str;
              description = "Host to bind webserver.";
              default = "127.0.0.1";
              example = "0.0.0.0";
            };

            extraArgs = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              description = "Extra arguments passed to `binternet`. (php flags)";
              default = [ ];
            };
          };
        };

        config = lib.mkIf cfg.enable {
          systemd.services.binternet = {
            after = [ "network.target" ];
            wantedBy = [ "multi-user.target" ];

            serviceConfig = {
              Type = "simple";
              ExecStart = lib.concatStringsSep " " (
                [
                  (lib.getExe pkgs.php84)
                  # https://github.com/Ahwxorg/Binternet/blob/c3a3ce76bf12b8dfabebaa14f33e46181ac199d3/Dockerfile#L3
                  "-S ${cfg.host}:${toString cfg.port}"
                  "-t ${cfg.package}"
                ]
                ++ cfg.extraArgs
              );
            };
          };

          networking.firewall = lib.mkIf cfg.openFirewall {
            allowedTCPPorts = [ cfg.port ];
          };
        };
      };
  };
}
