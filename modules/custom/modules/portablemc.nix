{
  zen.custom.portablemc = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.portablemc;
      in
      {
        options = {
          programs.portablemc = {
            enable = lib.mkEnableOption "PortableMC, a portable Minecraft launcher with mod support";

            package = lib.mkPackageOption pkgs "portablemc" {
              nullable = true;
            };

            settings = lib.mkOption {
              type = lib.types.attrs;
              default = { };
              description = "Minecraft options.txt settings passed to lib.genMinecraftOptions.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          home.file = {
            ".minecraft/options.txt".text = lib.mkIf (cfg.settings != null) (
              lib.genMinecraftOptions cfg.settings
            );
          };
        };
      };
  };
}
