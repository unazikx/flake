# INFO:
# sets stylix image as niri background

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
          hm.systemd.user.services.stylix-bg-niri = {
            Unit = {
              Description = "Sets stylix image as background for niri";
              After = [ "niri.service" ];
              Wants = [ "niri.service" ];
            };

            Service = {
              ExecStart = lib.concatStringsSep " " [
                (lib.getExe pkgs.swaybg)
                "--image"
                config.stylix.image
              ];

              Type = "simple";
              KillMode = "process";
              Restart = "on-failure";
              RestartSec = 5;
            };

            Install.WantedBy = [ "graphical-session.target" ];
          };
        };
    };
}
