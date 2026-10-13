{
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   nixpkgs-multiverse = {
  #     type = "github";
  #     owner = "fzakaria";
  #     repo = "nixpkgs-multiverse";
  #     ref = "main";
  #   };
  #   # keep-sorted end
  # };

  zen.miscellaneous.nixpkgs-multiverse = {
    os =
      {
        ...
      }:
      { };
  };
}
