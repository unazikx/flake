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
    (builtins.listToAttrs secretsList)
    // {
      _bare.${hostname} = secrets;
    };

  mapping = args: (map (config: processHost config args.${config}) (builtins.attrNames args));
in

args: builtins.foldl' (default: attrs: default // attrs) { } (mapping args)
