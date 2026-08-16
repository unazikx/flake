{
  zen.custom.hyprism = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.hyprism;
        json = pkgs.formats.json { };
      in
      {
        options = {
          programs.hyprism = {
            enable = lib.mkEnableOption "Hyprism, a Hyprland screenshot and region capture GUI";

            package = lib.mkPackageOption pkgs "hyprism" {
              nullable = true;
            };

            java = {
              package = lib.mkPackageOption pkgs "jre25_minimal" {
                nullable = true;
              };

              args = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                default = [ ];
                description = "Extra JVM arguments passed to Hyprism.";
              };
            };

            settings = lib.mkOption {
              type = json.type;
              default = { };
              description = "Hyprism config.json settings merged with Java path and arguments.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.dataFile = {
            "HyPrism/config.json" = {
              source = lib.mkIf (cfg.settings != null) (
                json.generate "hyprism-config.json" (
                  lib.mkMerge [
                    cfg.settings
                    {
                      CustomJavaPath = lib.getExe cfg.java.package;
                      UseCustomJava = lib.mkIf (cfg.java.package != null) true;
                      JavaArguments = lib.concatStringsSep " " cfg.java.args;
                    }
                  ]
                )
              );
              force = false;
            };
          };
        };
      };
  };
}
