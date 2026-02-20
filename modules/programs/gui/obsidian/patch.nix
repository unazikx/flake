{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.obsidian;
in
with lib;

{
  options.programs.obsidian = {
    extraSettings = mkOption {
      description = "Additional settings to include in obsidian.json.";
      type = types.attrsOf types.anything;
      default = { };
    };
  };

  config = mkIf cfg.enable (
    let
      vaults = builtins.filter (vault: vault.enable == true) (attrValues cfg.vaults);
    in
    {
      home.activation.obsidian = mkForce "# godamn u karaodlis";
      xdg.configFile."obsidian/obsidian.json".source = mkForce (
        (pkgs.formats.json { }).generate "obsidian.json" (
          {
            vaults = listToAttrs (
              map (vault: {
                name = builtins.hashString "md5" vault.target;
                value = {
                  path = concatStringsSep "/" [
                    config.home.homeDirectory
                    vault.target
                  ];
                }
                // (attrsets.optionalAttrs ((length vaults) == 1) { open = true; });
              }) vaults
            );
            updateDisabled = true;
          }
          // cfg.extraSettings # INFO: THIS MAIN EDIT
        )
      );
    }
  );
}
