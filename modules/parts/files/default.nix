{
  inputs,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
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
