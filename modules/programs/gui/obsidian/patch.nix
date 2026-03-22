{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.obsidian;
in

{
  options.programs.obsidian = {
    extraSettings = lib.mkOption {
      description = "Additional settings to include in obsidian.json.";
      type = lib.types.attrsOf lib.types.anything;
      default = { };
    };
  };

  config = lib.mkIf cfg.enable (
    let
      vaults = lib.filter (vault: vault.enable == true) (lib.attrValues cfg.vaults);
    in
    {
      home.activation.obsidian = lib.mkForce "# godamn u karaodlis";

      xdg.configFile."obsidian/obsidian.json".source = lib.mkForce (
        (pkgs.formats.json { }).generate "obsidian.json" (
          lib.mkMerge [
            {
              vaults = lib.listToAttrs (
                map (vault: {
                  name = lib.hashString "md5" vault.target;
                  value = {
                    path = vault.target;
                  }
                  // (lib.attrsets.optionalAttrs ((lib.length vaults) == 1) { open = true; });
                }) vaults
              );
            }
            cfg.extraSettings
          ]
        )
      );
    }
  );
}
