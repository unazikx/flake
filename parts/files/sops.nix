{
  config,
  lib,
  ...
}:

let
  inherit (builtins) attrNames;

  isInternal =
    name:
    lib.hasPrefix "_" name
    || lib.hasPrefix "__" name
    || builtins.elem name [
      "class"
      "name"
      "meta"
      "key"
      "_type"
      "description"
      "provider"
      "includes"
      "excludes"
      "classes"
      "policies"
      "provides"
      "schema"
    ];

  cleanAttrs = lib.filterAttrs (n: _: !isInternal n);

  denSystems = cleanAttrs (config.den.hosts or { });
  systemNames = attrNames denSystems;

  hostsWithKeys = lib.flatten (
    map (
      sys:
      map (name: {
        inherit name;
        key = denSystems.${sys}.${name}.sopsKey or null;
      }) (attrNames (cleanAttrs (denSystems.${sys} or { })))
    ) systemNames
  );

  hosts = lib.filter (h: h.key != null) hostsWithKeys;

  usersWithKeys = lib.flatten (
    map (
      sys:
      map (
        hostname:
        let
          users = cleanAttrs (denSystems.${sys}.${hostname}.users or { });
          userNames = attrNames users;
        in
        map (un: {
          name = un;
          key = users.${un}.sopsKey or null;
        }) userNames
      ) (attrNames (cleanAttrs (denSystems.${sys} or { })))
    ) systemNames
  );

  users = lib.filter (u: u.key != null) usersWithKeys;

  allKeys = hosts ++ users;
in

{
  perSystem =
    {
      ...
    }:
    {
      files.file.".sops.yaml" = {
        text = ''
          # INFO:
          # > ssh-to-age < ~/.ssh/id_ed25519.pub
          # or
          # > nix run nixpkgs#ssh-to-age -- < ~/.ssh/id_ed25519.pub
          #
          # TIPS:
          # you can change this file location
          # > sops --config .sops.yaml <secrets-file.yaml>
          #
          # to rekey secrets
          # > sops updatekeys ./file

          keys:
          ${lib.concatStringsSep "\n" (map (e: "  - &${e.name} ${e.key}") allKeys)}

          creation_rules:
            - path_regex: .+\.(yaml|json|env|ini)$
              key_groups:
                - age:
          ${lib.concatStringsSep "\n" (map (e: "          - *${e.name}") allKeys)}
        '';
      };
    };
}
