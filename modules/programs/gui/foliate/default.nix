# INFO:
# just read books from various sources

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          ...
        }:
        let
          json = pkgs.formats.json { };
        in
        {
          hm = {
            programs.foliate.enable = true;

            xdg.dataFile = {
              "com.github.johnfactotum.Foliate/catalogs/catalogs.json".source =
                json.generate "foliate-config.json"
                  {
                    catalogs = [
                      {
                        title = "Internet Archive";
                        uri = "https://bookserver.archive.org/catalog";
                      }
                      {
                        title = "Flibusta";
                        uri = "http://flibusta.is/opds";
                      }
                      {
                        title = "Samlib";
                        uri = "http://opdshome.uo1.net/samlib";
                      }
                    ];
                  };
            };
          };
        };
    };
}
