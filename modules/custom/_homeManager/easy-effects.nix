{
  config,
  pkgs,
  lib,
  ...
}:

let
  jsonFormat = pkgs.formats.json { };
  cfg = config.services.easyeffects;
in

{
  config = lib.mkIf (cfg.enable && cfg.extraPresets or { } != { }) {
    xdg.configFile = lib.mapAttrs' (
      key: value:
      let
        folder = builtins.head (builtins.attrNames value);
      in
      lib.nameValuePair "easyeffects/${folder}/${key}.json" {
        source = jsonFormat.generate "${folder}-${key}.json" value;
      }
    ) cfg.extraPresets;
  };
}
