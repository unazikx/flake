{
  zen,
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   fastpotify = {
  #     type = "github";
  #     owner = "crmne";
  #     repo = "fastpotify";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #   };
  #   # keep-sorted end
  # };

  zen.programs.cli.fastpotify = {
    description = ''
      tui spotify player
      idk wat is it
    '';

    includes = [
      zen.custom.fastpotify
    ];

    homeManager =
      {
        inputs',
        ...
      }:
      {
        programs.fastpotify = {
          enable = true;

          package = inputs'.fastpotify.packages.fastpotify;
        };
      };
  };
}
