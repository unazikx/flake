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
              lib.optional (conf ? secrets) {
                inherit name;
                keys = [ conf.secrets.age ];
              };

            toCombinedEntry =
              hostName: hostConf: userName: userConf:
              lib.optional (userConf ? secrets) {
                name = "${userName}-${hostName}";
                keys = [
                  (lib.optionalString (hostConf ? secrets) hostConf.secrets.age)
                  userConf.secrets.age
                ];
              };

            keysFrom =
              byArch:
              lib.flatten (
                lib.mapAttrsToList (
                  _arch: byName:
                  lib.mapAttrsToList (
                    name: conf:
                    toEntry name conf
                    ++ lib.mapAttrsToList toEntry (clean (conf.users or { }))
                    ++ lib.mapAttrsToList (toCombinedEntry name conf) (clean (conf.users or { }))
                  ) (clean byName)
                ) (clean byArch)
              );

            allConfigurations = lib.unique (
              lib.flatten [
                (keysFrom (config.den.hosts or { }))
                (keysFrom (config.den.homes or { }))
              ]
            );

            sharedKeys = lib.unique (lib.flatten (map (c: c.keys) allConfigurations));
          in
          {
            yaml.creation_rules = lib.flatten [
              (map (configuration: {
                path_regex = "secrets/${configuration.name}/[^/]+\.*$";
                key_groups = [
                  {
                    age = configuration.keys;
                  }
                ];
              }) allConfigurations)

              {
                path_regex = "secrets/shared/[^/]+\.(yaml|json|env|ini)$";
                key_groups = [
                  {
                    age = sharedKeys;
                  }
                ];
              }
            ];
          };
      };
  };
}
