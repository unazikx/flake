{
  inputs,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    make-shell = {
      type = "github";
      owner = "nicknovitski";
      repo = "make-shell";
    };
    # keep-sorted end
  };

  imports = [
    inputs.make-shell.flakeModules.default
  ];
}
