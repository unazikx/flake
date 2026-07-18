{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    tele = {
      type = "github";
      owner = "sorokin-vladimir";
      repo = "tele";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    # keep-sorted end
  };

  zen.programs.cli.tele = {
    description = ''
      terminal telegram client
      by on keyboard
    '';

    homeManager =
      {
        inputs',
        ...
      }:
      {
        home.packages = [
          inputs'.tele.packages.default
        ];
      };
  };
}
