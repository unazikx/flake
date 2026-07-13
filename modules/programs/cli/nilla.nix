{
  ...
}:

{
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
