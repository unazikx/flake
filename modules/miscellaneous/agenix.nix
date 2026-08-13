{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    agenix = {
      type = "github";
      owner = "ryantm";
      repo = "agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "nix-darwin";
      inputs.home-manager.follows = "home-manager";
    };
    # keep-sorted end
  };

  zen.miscellaneous.agenix = {
    os =
      {
        inputs',
        pkgs,
        host,
        ...
      }:
      {
        environment = {
          systemPackages = [
            inputs'.agenix.packages.agenix
            pkgs.age
            pkgs.ssh-to-age
          ];

          variables = {
            RULES = "${host.flakeDir}/.age.nix";
          };
        };
      };

    nixos =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.agenix.nixosModules.age
        ];
      };

    darwin =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.agenix.darwinModules.age
        ];
      };

    homeManager =
      {
        inputs,
        inputs',
        pkgs,
        ...
      }:
      {
        imports = [
          inputs.agenix.homeManagerModules.age
        ];

        home.packages = [
          inputs'.agenix.packages.agenix
          pkgs.age
          pkgs.ssh-to-age
        ];
      };

    homeManagerNixos =
      {
        host,
        ...
      }:
      {
        home.sessionVariables = {
          RULES = "${host.flakeDir}/.age.nix";
        };
      };

    homeManagerStandalone =
      {
        user,
        ...
      }:
      {
        home.sessionVariables = {
          RULES = "${user.flakeDir}/.age.nix";
        };
      };
  };
}
