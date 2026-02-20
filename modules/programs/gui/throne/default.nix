{
  flake =
    {
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
          cfg = config.programs.throne;
        in
        {
          persist.user.directories = [ ".config/Throne" ];

          programs.throne = {
            enable = true;
            tunMode.enable = true;
          };

          hm.systemd.user.services.throne-tray = {
            Unit = {
              Description = cfg.package.meta.description;
              After = [ "graphical-session.target" ];
            };

            Service = {
              ExecStart = lib.concatStringsSep " " [
                (lib.getExe cfg.package)
                "-tray"
                "-appdata"
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
