{
  zen.custom.wiki = {
    root =
      {
        lib,
        ...
      }:
      let
        urlType = lib.types.submodule {
          options = {
            logo = lib.mkOption {
              type = lib.types.str;
              description = "Logo for URL.";
              example = "https://example.com/logo";
            };

            name = lib.mkOption {
              type = lib.types.str;
              description = "Name for URL.";
              example = "example";
            };

            url = lib.mkOption {
              type = lib.types.str;
              description = "URL for wiki.";
              example = "https://example.com/wiki";
            };

            extra = lib.mkOption {
              type = lib.types.nullOr lib.types.lines;
              description = "Extra content for this wiki url.";
              example = "example";
            };
          };
        };

        wikiSources = lib.types.submodule {
          options = {
            links = lib.mkOption {
              type = lib.types.listOf urlType;
              default = [ ];
              description = "List of URLs for this wiki source.";
              example = [
                {
                  name = "example";
                  url = "https://example.com";
                }
              ];
            };

            extra = lib.mkOption {
              type = lib.types.nullOr lib.types.lines;
              default = "";
              description = "Extra content or configuration for this wiki source.";
              example = ''
                I DUNNO
              '';
            };
          };
        };
      in
      {
        options = {
          wiki = lib.mkOption {
            type = lib.types.attrsOf wikiSources;
            default = { };
            description = "Wiki configurations for arbitrary sources.";
          };
        };
      };
  };
}
