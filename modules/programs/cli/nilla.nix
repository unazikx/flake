{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nilla-cli = {
      type = "github";
      owner = "nilla-nix";
      repo = "cli";
    };
    # keep-sorted end
  };

  zen.programs.cli.nilla = {
    description = ''
      export shell variables for tokens
      alias for repl and rebuild
      nurl -> prefetch repos and other
    '';

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = [
          pkgs.nilla-cli
          pkgs.npins
        ];
      };
  };
}
