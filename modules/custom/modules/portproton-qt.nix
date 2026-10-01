{
  zen.custom.portproton-qt = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.portproton-qt;
        ini = pkgs.formats.ini { };
      in
      {
        options = {
          programs.portproton-qt = {
            enable = lib.mkEnableOption "PortProton-Qt, multi launcher for games and apps";

            package = lib.mkPackageOption pkgs "portproton-qt" {
              nullable = true;
            };

            settings = lib.mkOption {
              type = ini.type;
              default = { };
              description = "PortProton-Qt settings.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.dataFile = {
            "PortProtonQt.conf".source = lib.mkIf (cfg.settings != null) (
              ini.generate "portprotonqt.ini" cfg.settings
            );
          };
        };
      };
  };
}
