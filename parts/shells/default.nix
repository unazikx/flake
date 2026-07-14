{
  inputs,
  ...
}:

{
  flake-file.inputs.make-shell = {
    type = "github";
    owner = "nicknovitski";
    repo = "make-shell";
  };

  imports = [
    inputs.make-shell.flakeModules.default
  ];
}
