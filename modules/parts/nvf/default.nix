{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nvf = {
      type = "github";
      owner = "notashelf";
      repo = "nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };
}
