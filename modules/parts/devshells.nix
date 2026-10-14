{
  inputs,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    devshells = {
      type = "github";
      owner = "numtide";
      repo = "devshell";
      ref = "main";
    };
    # keep-sorted end
  };

  imports = [
    inputs.devshells.flakeModule
  ];
}
