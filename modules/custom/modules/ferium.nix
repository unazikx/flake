{
  zen.custom.ferium = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.ferium;
      in
      {
        options = {
          programs.ferium = {
            enable = lib.mkEnableOption "Ferium, a CLI tool for updating Minecraft mods and modpacks";

            package = lib.mkPackageOption pkgs "ferium" {
              nullable = true;
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];
        };
      };
  };
}
