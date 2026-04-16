# INFO:
# sync directories via devices
# supports: LAN and internet

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
          cfg = config.hm.services.syncthing;
        in
        {
          persist.user.directories = [ ".local/state/syncthing" ];

          hmPackages = [ pkgs.stc-cli ];

          hm.services.syncthing = {
            enable = true;

            guiAddress = "0.0.0.0:8384";

            cert = config.sopsnix."syncthing/cert" or null;
            key = config.sopsnix."syncthing/key" or null;

            settings = {
              folders =
                let
                  inherit (config.hm.services.syncthing.settings)
                    devices
                    ;
                in

                lib.listToAttrs [
                  (lib.syncthing.mkFolder {
                    name = "notes";
                    id = "kudfyfcmxhtpt8ta";
                    path = "${config.hm.xdg.userDirs.publicShare}/notes";
                    devices = lib.syncthing.mkFilter devices [ ];
                  })

                  (lib.syncthing.mkFolder {
                    name = "tempbin";
                    id = "yew4af7dtnmnuwdr";
                    path = "${config.hm.xdg.userDirs.publicShare}/tempbin";
                    devices = lib.syncthing.mkFilter devices [ ];
                  })
                ];

              options = {
                relaysEnabled = true;
                urAccepted = -1;
                localAnnounceEnabled = true;
                localAnnouncePort = 21027;
              };

              gui = {
                user = lib.userName;
                passwordFile = config.sopsnix."services/syncthing/password";
              };
            };
          };

          services.caddy.virtualHosts =
            lib.genAttrs
              [
                "syncthing.${lib.hostName}.local"
              ]
              (_: {
                extraConfig = ''
                  encode zstd gzip
                  reverse_proxy http://${toString cfg.guiAddress}
                '';
              });

          networking.firewall = rec {
            allowedTCPPorts = [ 22000 ];
            allowedUDPPorts = allowedTCPPorts ++ [ 21027 ];

            interfaces = {
              "tailscale0".allowedTCPPorts = [ 8384 ];
            };
          };
        };
    };
}
