{
  lib,
  config,
  ...
}:

{
  zen.flake-parts.default = {
    files =
      {
        ...
      }:
      {
        file.".sops.yaml" =
          let
            clean = lib.filterAttrs (name: _: !lib.hasPrefix "_" name);

            toEntry =
              name: conf:
              lib.optional (conf ? sopsKey) {
                inherit name;
                key = conf.sopsKey;
              };

            searchKeyFrom =
              attrs:
              lib.flatten (
                lib.mapAttrsToList (
                  _: value:
                  lib.flatten [
                    (lib.mapAttrsToList toEntry (clean value))
                    (searchKeyFrom (value.users or { }))
                  ]
                ) (clean attrs)
              );

            allKeys = lib.flatten [
              (searchKeyFrom (config.den.hosts or { }))
              (searchKeyFrom (config.den.homes or { }))
            ];
          in
          {
            yaml = {
              creation_rules = lib.flatten [
                (map (configuration: {
                  path_regex = "secrets/${configuration.name}/[^/]+\.(yaml|json|env|ini)$";
                  key_groups = [
                    {
                      age = [ configuration.key ];
                    }
                  ];
                }) allKeys)
              ];
            };
          };
      };
  };
}
