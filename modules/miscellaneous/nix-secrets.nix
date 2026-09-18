{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nix-secrets = {
      type = "github";
      owner = "unnamed-systems";
      repo = "nix-secrets";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.miscellaneous.nix-secrets = {
    meta = {
      dir = "/var/lib";
    };

    includes = [
      zen.hardware.security.yubikey
    ];

    nixos =
      {
        self,
        inputs,
        host,
        ...
      }:
      {
        imports = [
          inputs.nix-secrets.nixosModules.nix-secrets
        ];

        security.nix-secrets = {
          enable = true;

          storage = "${self}/secrets/${host.hostName}/nixed";
          storagePath = "${host.flakeDir}/secrets/${host.hostName}/nixed";

          identityPaths = [
            "/persistent/home/teajhay/.ssh/keys.txt"
            "/persistent/home/teajhay/.ssh/id_ed25519"
          ];
        };
      };

    homeManager =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.nix-secrets.homeManagerModules.nix-secrets
        ];

        security.nix-secrets = {
          enable = true;
        };
      };

    homeManagerNixos =
      {
        self,
        host,
        user,
        ...
      }:
      {
        security.nix-secrets = {
          storage = "${self}/secrets/${user.userName}/nixed";
          storagePath = "${host.flakeDir}/secrets/${user.userName}/nixed";

          identityPaths = [
            "/persistent/home/teajhay/.ssh/keys.txt"
            "/persistent/home/teajhay/.ssh/id_ed25519"
          ];
        };
      };
  };
}
