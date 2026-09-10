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

            keysFrom =
              byArch:
              lib.flatten (
                lib.mapAttrsToList (
                  _arch: byName:
                  lib.mapAttrsToList (
                    name: conf: toEntry name conf ++ lib.mapAttrsToList toEntry (clean (conf.users or { }))
                  ) (clean byName)
                ) (clean byArch)
              );
          in
          {
            yaml.creation_rules = (
              map
                (configuration: {
                  path_regex = "secrets/${configuration.name}/[^/]+\.(yaml|json|env|ini)$";
                  key_groups = [
                    {
                      age = [ configuration.key ];
                    }
                  ];
                })
                (
                  lib.unique (
                    lib.flatten [
                      (keysFrom (config.den.hosts or { }))
                      (keysFrom (config.den.homes or { }))
                    ]
                  )
                )
            );
          };
      };
  };
}
