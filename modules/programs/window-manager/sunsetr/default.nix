# INFO:
# blue filter
# for eyes saver
#
# universal for all wayland cm

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
          pkg = pkgs.sunsetr;

          toml = pkgs.formats.toml { };
        in
        {
          hm = {
            systemd.user.services.sunsetr = {
              Unit = {
                Description = pkg.meta.description;
                PartOf = [ "graphical-session.target" ];
                After = [ "graphical-session.target" ];
              };

              Service = {
                ExecStart = lib.getExe pkg;
                Type = "simple";
                Restart = "on-failure";
                RestartSec = 5;
              };

              Install.WantedBy = [ "graphical-session.target" ];
            };

            xdg.configFile = lib.mkMerge [
              {
                "sunsetr/geo.toml".source = lib.mkSymlink config.sopsnix."services/sunsetr";
                "sunsetr/sunsetr.toml".source = toml.generate "sunsetr.toml" {
                  backend = "auto";
                  transition_mode = "geo";

                  smoothing = true;
                  startup_duration = 2;
                  shutdown_duration = 2;
                  adaptive_interval = 1;

                  night_temp = 3900;
                  night_gamma = 90;
                  day_temp = 6500;
                  day_gamma = 100;

                  static_temp = 6500;
                  static_gamma = 100;

                  # sunset = "23:00:00";
                  # sunrise = "06:00:00";
                  transition_duration = 45;
                  update_interval = 60;
                };
              }
              (lib.mkMerge (
                map (
                  file:
                  let
                    src = toml.generate "${name}-sunsetr.toml" (import file);
                    name = lib.removeSuffix ".nix" (baseNameOf file);
                  in
                  {
                    "sunsetr/presets/${name}/sunsetr.toml".source = src;
                  }
                ) (lib.filesystem.listFilesRecursive ./presets)
              ))
            ];
          };
        };
    };
}
