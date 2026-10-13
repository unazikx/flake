{
  inputs,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
      ref = "main";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  imports = [
    inputs.flake-parts.flakeModules.modules
  ];
}
