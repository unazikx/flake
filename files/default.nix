{
  inputs,
  lib,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    dag = {
      type = "github";
      owner = "denful";
      repo = "dag";
    };

    files = {
      type = "github";
      owner = "sini";
      repo = "files";
    };
    # keep-sorted end
  };

  imports = [
    inputs.files.flakeModules.default
  ];

  _module.args.dag = inputs.dag.lib {
    inherit lib;
  };

  zen.flake-parts.default = {
    files =
      {
        ...
      }:
      {
        generateApp = true;
        treefmt.enable = true;
      };
  };
}
