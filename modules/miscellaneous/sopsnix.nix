{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    sopsnix = {
      type = "github";
      owner = "mic92";
      repo = "sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.miscellaneous.sopsnix = {
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
          inputs.sopsnix.nixosModules.sops
        ];
      };

    darwin =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.sopsnix.darwinModules.sops
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
          inputs.sopsnix.homeModules.sops
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
