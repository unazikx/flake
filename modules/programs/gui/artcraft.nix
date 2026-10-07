{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    tixpkgs = {
      type = "github";
      owner = "74k1";
      repo = "tixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.home-manager.follows = "home-manager";
      inputs.nixpkgs-waterfox.follows = "";
    };
    # keep-sorted end
  };

  zen.programs.gui.artcraft = {
    description = ''
      open-source alternatives for Abobe
    '';

    homeManagerNixos =
      {
        inputs',
        lib,
        ...
      }:
      {
        home.packages = lib.attrValues {
          "Photoshop" = inputs'.tixpkgs.packages.photocraft-bin;
          "Lightroom" = inputs'.tixpkgs.packages.lightcraft-bin;
          "AfterEffects" = inputs'.tixpkgs.packages.effectcraft-bin;
          "PremierePro" = inputs'.tixpkgs.packages.filmcraft-bin;
          "Illustrator" = inputs'.tixpkgs.packages.vectorcraft-bin;
        };
      };
  };
}
