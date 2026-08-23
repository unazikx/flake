{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    occt-nix = {
      type = "github";
      owner = "daaboulex";
      repo = "occt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    # keep-sorted end
  };

  zen.programs.gui.occt = {
    description = ''
      all-in-one software used to:
      stress test, benchmark, and pc hardware stability
    '';

    nixos =
      {
        inputs',
        ...
      }:
      {
        environment.systemPackages = [
          inputs'.occt.packages.occt
        ];
      };
  };
}
