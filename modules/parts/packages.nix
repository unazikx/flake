{
  self,
  inputs,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    pkgs-by-name = {
      type = "github";
      owner = "drupol";
      repo = "pkgs-by-name-for-flake-parts";
    };
    # keep-sorted end
  };

  imports = [
    inputs.pkgs-by-name.flakeModule
  ];

  perSystem =
    {
      system,
      ...
    }:
    {
      pkgsDirectory = "${self}/packages";
      # pkgsNameSeparator = ".";

      _module.args.pkgs = import inputs.nixpkgs {
        inherit
          system
          ;

        config.allowUnfree = true;
        overlays = [
          inputs.nur.overlays.default
        ];
      };
    };
}
