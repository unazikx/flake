let
  processHost =
    hostname:
    {
      key,
      secrets,
    }:
    let
      secretsList = map (secret: {
        name = "secrets/${hostname}/${secret}.age";
        value = {
          publicKeys = [ key ];
        };
      }) secrets;
    in
    builtins.listToAttrs secretsList;

  foldl = args: builtins.foldl' (default: attrs: default // attrs) { } (mapping args);

  mapping = args: (map (config: processHost config args.${config}) (builtins.attrNames args));
in

foldl {
  jetpure = {
    key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGRUwtclBrPdWkOW0B7x/1jA26qObmURF9A8F9Tyqlmg";
    secrets = [
      "passwords/nixzoid"
      "passwords/root"
    ];
  };
}
