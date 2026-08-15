{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    xmcl = {
      type = "github";
      owner = "x45iq";
      repo = "xmcl-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.games.minecraft.xmcl = {
    description = ''
      another launcher for minecraft
    '';

    homeManager =
      {
        inputs,
        pkgs,
        ...
      }:
      {
        imports = [
          inputs.xmcl.homeModules.xmcl
        ];

        programs.xmcl = {
          enable = true;

          jres = zen.games.minecraft.meta.temurinJRE pkgs;
        };
      };
  };
}
