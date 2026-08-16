{
  zen.custom.foliate = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.foliate;
        json = pkgs.formats.json { };
      in
      {
        options = {
          programs.foliate = {
            catalogs = lib.mkOption {
              type = lib.types.listOf lib.types.attrs;
              default = [
                {
                  title = "Internet Archive";
                  uri = "https://bookserver.archive.org/catalog";
                }
              ];
              description = "OPDS catalogs for Foliate.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          xdg.dataFile = lib.mkIf (cfg.catalogs != [ ]) {
            "com.github.johnfactotum.Foliate/catalogs/catalogs.json".source =
              json.generate "foliate-catalogs.json"
                {
                  catalogs = cfg.catalogs;
                };
          };
        };
      };
  };
}
