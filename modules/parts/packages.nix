{
  self,
  inputs,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nur = {
      type = "github";
      owner = "nix-community";
      repo = "nur";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

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

  zen.flake-parts.default = {
    root =
      {
        config,
        system,
        ...
      }:
      {
        pkgsDirectory = "${self}/packages";
        pkgsNameSeparator = "-";

        _module.args.pkgs = import inputs.nixpkgs {
          inherit
            system
            ;

          config.allowUnfree = true;
          overlays = [
            self.overlays.nixpkgs-branches
            self.overlays.system-backport
            inputs.nur.overlays.default
            (_new: _prev: {
              self = self;
              system = system;
              local = config.packages;
            })
          ];
        };
      };
  };
}
