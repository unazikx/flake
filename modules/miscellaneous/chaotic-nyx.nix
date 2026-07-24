{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    chaotic-nyx = {
      type = "github";
      owner = "chaotic-cx";
      repo = "nyx";
      ref = "nyxpkgs-unstable";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    # keep-sorted end
  };

  zen.miscellaneous.chaotic-nyx = {
    description = ''
      precompiled and bleeding edge packages
      have binares for jovian also
    '';

    nixos =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.chaotic-nyx.nixosModules.default
        ];
      };

    homeManager =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.chaotic-nyx.homeManagerModules.default
        ];
      };
  };
}
