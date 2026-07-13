{
  lib,
  config,
  ...
}:

let
  dig =
    attrs:
    lib.flatten (
      lib.mapAttrsToList (
        _: value:
        lib.flatten (
          lib.mapAttrsToList (
            name: conf:
            lib.optionals (conf ? sopsKey) [
              {
                name = name;
                key = conf.sopsKey;
              }
            ]
          ) (lib.filterAttrs (name: _: !lib.hasPrefix "_" name) value)
        )
        ++ dig (value.users or { })
      ) (lib.filterAttrs (name: _: !lib.hasPrefix "_" name) attrs)
    );

  allKeys = dig (config.den.hosts or { }) ++ dig (config.den.homes or { });
in

{
  perSystem = { ... }: {
    files.file.".sops.yaml" = {
      text = ''
        # INFO:
        # nix run nixpkgs#ssh-to-age -- < ~/.ssh/id_ed25519.pub

        keys:
          ${lib.concatStringsSep "\n" (map (entry: "- &${entry.name} ${entry.key}") allKeys)}

        creation_rules:
          - path_regex: .+\.(yaml|json|env|ini)$
            key_groups:
              - age:
                  ${lib.concatStringsSep "\n" (map (entry: "- *${entry.name}") allKeys)}
      '';
    };
  };
}
