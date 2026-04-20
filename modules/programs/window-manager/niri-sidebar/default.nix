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
        let
          cfg = config.hm.programs.niri;
          pkg = pkgs.own.niri-sidebar;

          toml = pkgs.formats.toml { };
        in
        {
          hm.systemd.user.services.niri-sidebar = {
            Unit = {
              Description = pkg.meta.description;
              After = [ "niri.service" ];
              Wants = [ "niri.service" ];
            };

            Service = {
              ExecStart = "${lib.getExe pkg} listen";

              Type = "simple";
              KillMode = "process";
              Restart = "on-failure";
              RestartSec = 5;
            };

            Install.WantedBy = [ "graphical-session.target" ];
          };

          hm = {
            xdg.configFile = {
              "niri-sidebar/config.toml".source = toml.generate "config.toml" {
                geometry = {
                  width = 400;
                  height = 335;
                  gap = 18;
                };

                margins = lib.genAttrs [
                  "top"
                  "right"
                  "left"
                  "bottom"
                ] (_: 24);

                interaction = {
                  position = "right";
                  peek = 8;
                  focus_peek = 24;
                  sticky = true;
                };

                window_rule = [
                  {
                    app_id = "firefox";
                    title = "^Picture-in-Picture$";
                    width = 700;
                    height = 400;
                    focus_peek = 710;
                    peek = 10;
                    auto_add = true;
                  }
                ];
              };
            };

            programs.niri.settings.binds = with config.hm.lib.niri.actions; {
              "Mod+O".action = spawn-sh "${lib.getExe pkg} focus";
              "Mod+P".action = spawn-sh "${lib.getExe pkg} toggle-window";
              "Mod+Shift+P".action = spawn-sh "${lib.getExe pkg} toggle-visibility";
            };
          };
        };
    };
}
