{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.services.sunsetr;
  toml = pkgs.formats.toml { };
in

{
  options = {
    services.sunsetr = {
      enable = lib.mkEnableOption "Sunsetr, a Wayland blue light filter";

      package = lib.mkPackageOption pkgs "sunsetr" {
        nullable = true;
      };

      settings = lib.mkOption {
        type = lib.types.attrs;
        default = { };
        description = "Sunsetr configuration written to sunsetr.toml.";
      };

      geoLocation = lib.mkOption {
        type = lib.types.nullOr lib.types.path;
        default = null;
        description = "Path to a geo TOML file. Typically config.sops.secrets.<name>.path.";
      };

      presets = lib.mkOption {
        type = lib.types.attrsOf lib.types.attrs;
        default = { };
        description = "Sunsetr presets, each written to presets/<name>/sunsetr.toml.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

    systemd.user.services.sunsetr = {
      Unit = {
        Description = cfg.package.meta.description;
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };

      Service = {
        ExecStart = lib.getExe cfg.package;
        Type = "simple";
        Restart = "on-failure";
        RestartSec = 5;
      };

      Install.WantedBy = [ "graphical-session.target" ];
    };

    xdg.configFile = lib.mkMerge [
      {
        "sunsetr/geo.toml".source = lib.mkIf (cfg.geoLocation != null) cfg.geoLocation;
        "sunsetr/sunsetr.toml".source = lib.mkIf (cfg.settings != { }) (
          toml.generate "sunsetr.toml" cfg.settings
        );
      }
      (lib.mkIf (cfg.presets != { }) (
        lib.mapAttrs' (
          name: preset:
          lib.nameValuePair "sunsetr/presets/${name}/sunsetr.toml" {
            source = toml.generate "${name}-sunsetr.toml" preset;
          }
        ) cfg.presets
      ))
    ];
  };
}
