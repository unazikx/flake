# INFO:
# modern clipboard with tofi frontend
# clipboard entries are in ~/.cache/clapboard

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
          pkg = pkgs.clapboard;

          inherit (config.hm.services.syncthing.settings)
            devices
            ;

          toml = pkgs.formats.toml { };
        in
        {
          hm = {
            services = {
              wl-clip-persist.enable = true;

              syncthing.settings.folders = lib.listToAttrs [
                (lib.syncthing.mkFolder {
                  name = "clipboard";
                  id = "kudfyfcmxhtpt8ta";
                  path = "${config.hm.xdg.cacheHome}/clapboard";
                  devices = lib.syncthing.mkFilter devices [
                    "nothing2a"
                    "windauser"
                  ];
                })
              ];
            };

            systemd.user.services.clapboard = {
              Unit = {
                Description = pkg.meta.description;
                After = [ "graphical-session.target" ];
              };

              Service = {
                ExecStart = lib.concatStringsSep " " [
                  (lib.getExe pkg)
                  "-r clipboard"
                ];

                Type = "simple";
                KillMode = "process";
                Restart = "on-failure";
                RestartSec = 5;
              };

              Install.WantedBy = [ "graphical-session.target" ];
            };

            xdg.configFile = lib.mkIf config.hm.programs.tofi.enable {
              "clapboard/config.toml".source = toml.generate "clapboard-config.toml" {
                # INFO: tofi args
                launcher = [
                  "tofi"
                  "--fuzzy-match=true"
                  "--prompt-text=copy: "
                  "--padding-left=20%"
                  "--padding-right=20%"
                  "--padding-top=12%"
                  "--padding-bottom=12%"
                  "--num-results=12"
                ];

                history_size = 48;
              };
            };
          };
        };
    };
}
