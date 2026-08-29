{
  zen.custom.fastpotify = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.fastpotify;
        json = pkgs.formats.json { };
      in
      {
        imports = lib.singleton (
          lib.stylix.mkTarget
            {
              name = "fastpotify";
              humanName = "Fastpotify";
            }
            {
              config = [
                ({ ... }: { })
              ];
            }
        );

        options = {
          programs.fastpotify = {
            enable = lib.mkEnableOption "fastpotify, TUI Spotify player";

            package = lib.mkPackageOption pkgs "spotatui" {
              nullable = true;
            };

            settings = lib.mkOption {
              type = json.type;
              default = null;
              description = "Content for $XDG_CONFIG_HOME/fastpotify/settings.json, written when non-null.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.configFile = lib.mkIf (cfg.settings != null) {
            "fastpotify/settings.json".source = (json.generate "fastpotify-config.yml" cfg.settings);
          };
        };
      };
  };
}
