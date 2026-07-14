{
  inputs,
  ...
}:

{
  flake-file.inputs.files = {
    type = "github";
    owner = "sini";
    repo = "files";
  };

  imports = [
    inputs.files.flakeModules.default
  ];

  perSystem =
    {
      ...
    }:
    {
      files = {
        generateApp = true;
        treefmt.enable = true;
      };
    };
}
