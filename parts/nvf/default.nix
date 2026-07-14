{
  ...
}:

{
  flake-file.inputs = {
    nvf = {
      type = "github";
      owner = "notashelf";
      repo = "nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
