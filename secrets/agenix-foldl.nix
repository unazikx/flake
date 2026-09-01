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
      _bare = {
        ${hostname} = secrets;
      };
    };

  mapping = args: (map (config: processHost config args.${config}) (builtins.attrNames args));
in

args:

let
  processed = mapping args;

  ageFiles = builtins.foldl' (
    acc: hostResult:
    let
      cleanResult = removeAttrs hostResult [ "_bare" ];
    in
    acc // cleanResult
  ) { } processed;

  bareAttrs = builtins.foldl' (
    acc: hostResult: if (hostResult ? _bare) then (acc // hostResult._bare) else acc
  ) { } processed;
in

ageFiles // { _bare = bareAttrs; }
