{
  zen.custom.libreoffice = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.libreoffice;
      in
      {
        options = {
          programs.libreoffice = {
            enable = lib.mkEnableOption "Libreoffice, good office suite";

            package = lib.mkPackageOption pkgs "libreoffice" {
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
