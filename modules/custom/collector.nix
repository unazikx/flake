{
  inputs,
  lib,
  ...
}:

{
  den.default = lib.genAttrs [
    "nixos"
    "darwin"
    "homeManager"
  ] (type: (inputs.import-tree ./_${type}));
}
