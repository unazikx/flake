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
        {
          persist.user.directories = [ ".local/state/syncthing" ];

          hmPackages = [ pkgs.stc-cli ];

          hm.services.syncthing = {
            enable = true;

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
                    path = "${config.hm.xdg.userDirs.documents}/notes";
                    devices = lib.syncthing.mkFilter devices [ ];
                  })

                  (lib.syncthing.mkFolder {
                    name = "tempbin";
                    id = "yew4af7dtnmnuwdr";
                    path = "${config.hm.xdg.userDirs.desktop}/tempbin";
                    devices = lib.syncthing.mkFilter devices [ ];
                  })
                ];

              options = {
                relaysEnabled = true;
                urAccepted = -1;
                localAnnounceEnabled = true;
                localAnnouncePort = 21027;
              };
            };
          };

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
