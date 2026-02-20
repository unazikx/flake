{
  lib,
  config,
  ...
}:

let
  cfg = config.sops;
in

{
  options = {
    sopsnix = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = { };
      description = "Shortcut paths to sopsnix secrets";
    };

    sopsplace = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = { };
      description = "Placeholders for secrets (used before decryption)";
    };

    sopstem = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = { };
      description = "Path to the rendered secret template";
    };
  };

  config = {
    sopsnix = lib.mapAttrs (n: _: cfg.secrets.${n}.path) cfg.secrets;
    sopstem = lib.mapAttrs (n: _: cfg.templates.${n}.path) cfg.templates;
    sopsplace = cfg.placeholder;
  };
}
