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
        self,
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

        age = {
          identityPaths = [
            "/home/${host.defaultUser}/.ssh/id_ed25519"
            "/root/.ssh/id_ed25519"
            "/secrets/root/id_ed25519"
          ];

          secrets = builtins.listToAttrs (
            map (name: {
              inherit name;
              value = {
                file = "${self}/secrets/${host.hostName}/${name}.age";
              };
            }) (import "${self}/.age.nix")._bare.${host.hostName}
          );
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
        self,
        inputs,
        inputs',
        pkgs,
        config,
        user,
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

        age = {
          identityPaths = [
            "${config.home.homeDirectory}/.ssh/id_ed25519"
            "/secrets/${user.userName}/.ssh/id_ed25519"
          ];

          secrets = builtins.listToAttrs (
            map (name: {
              inherit name;
              value = {
                file = "${self}/secrets/${user.userName}/${name}.age";
              };
            }) (import "${self}/.age.nix")._bare.${user.userName}
          );
        };
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
