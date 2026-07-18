{
  lib,
  config,
  ...
}:

let
  clean = lib.filterAttrs (name: _: !lib.hasPrefix "_" name);

  toEntry =
    name: conf:
    lib.optional (conf ? sopsKey) {
      inherit name;
      key = conf.sopsKey;
    };

  dig =
    attrs:
    lib.flatten (
      lib.mapAttrsToList (
        _: value: lib.flatten (lib.mapAttrsToList toEntry (clean value)) ++ dig (value.users or { })
      ) (clean attrs)
    );

  allKeys = dig (config.den.hosts or { }) ++ dig (config.den.homes or { });
in

{
  perSystem =
    {
      ...
    }:
    {
      files.file.".sops.yaml" = {
        yaml = {
          keys = map (entry: {
            name = entry.name;
            key = entry.key;
          }) allKeys;

          creation_rules = map (e: {
            path_regex = "configurations/${e.name}/sub-modules/_secrets\\.yaml$";
            key_groups = [ { age = [ e.key ]; } ];
          }) allKeys;
        };
      };
    };
}
