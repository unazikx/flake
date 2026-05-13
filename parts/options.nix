{
  lib,
  ...
}:

{
  options = {
    flake = {
      lib = lib.mkOption {
        description = "Attributes for various functions";
        type = lib.types.attrsOf lib.types.unspecified;
        default = { };
      };
    };
  };
}
