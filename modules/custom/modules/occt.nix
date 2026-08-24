{
  zen.custom.occt = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.occt;
      in
      {
        options = {
          programs.occt = {
            enable = lib.mkEnableOption "OCCT, stress tester and benchmarker";

            package = lib.mkPackageOption pkgs "occt" {
              nullable = true;
            };

            disableUpdates = lib.mkEnableOption "Disable updates for OCCT";
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.dataFile = {
            "occt/disable_update".text = lib.mkIf cfg.disableUpdates "";
          };
        };
      };
  };
}
