{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    sops-nix = {
      type = "github";
      owner = "mic92";
      repo = "sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.miscellaneous.secrets = {
    os =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        environment.systemPackages = [
          pkgs.sops
          pkgs.age
          pkgs.ssh-to-age
        ];

        sops = {
          age = {
            keyFile = "/var/lib/keys.txt";
            sshKeyPaths = lib.mapAttrsToList (_: user: "${user.home}/.ssh/id_ed25519") (
              lib.filterAttrs (_: user: user.isNormalUser) config.users.users
            );
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
          inputs.sops-nix.nixosModules.sops
        ];
      };

    darwin =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.sops-nix.darwinModules.sops
        ];
      };

    homeManager =
      {
        inputs,
        pkgs,
        lib,
        config,
        ...
      }:
      {
        imports = [
          inputs.sops-nix.homeModules.sops
        ];

        home.packages = [
          pkgs.sops
          pkgs.age
          pkgs.ssh-to-age
        ];

        sops = {
          age = {
            keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
            sshKeyPaths = lib.singleton "${config.home.homeDirectory}/.ssh/id_ed25519";
          };
        };
      };
  };
}
