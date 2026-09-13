{
  zen.custom.walogram = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        imports = lib.singleton (
          lib.stylix.mkTarget
            {
              name = "walogram";
              humanName = "walogram";
            }
            {
              options = {
                package = lib.mkPackageOption pkgs "walogram" {
                  nullable = true;
                };
              };

              config = [
                ({ cfg, colors }: {
                  home.activation = {
                    walogram =
                      lib.hm.dag.entryAfter
                        [
                          "writeBoundary"
                        ]
                        "run ${
                          lib.getExe (
                            cfg.package.override {
                              outputDir = config.xdg.cacheHome;
                              colors = colors.withHashtag;
                            }
                          )
                        }";
                  };
                })
              ];
            }
        );
      };
  };
}
