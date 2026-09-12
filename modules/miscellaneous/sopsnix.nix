{
  zen,
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
    meta = {
      dir = "/var/lib";
    };

    includes = [
      zen.custom.sopsnix
      zen.hardware.security.yubikey
    ];

    nixos =
      {
        inputs,
        pkgs,
        ...
      }:
      let
        meta = zen.miscellaneous.sopsnix.meta;
      in
      {
        imports = [
          inputs.sopsnix.nixosModules.sops
        ];

        environment.systemPackages = [
          pkgs.age
          pkgs.age-plugin-yubikey
          pkgs.sops
          pkgs.ssh-to-age
        ];

        environment.sessionVariables = {
          SOPS_AGE_KEY_FILE = "${meta.dir}/sops-yubikey";
        };

        sops.age = {
          keyFile = "${meta.dir}/sops-yubikey";
          plugins = [ pkgs.age-plugin-yubikey ];
        };
      };

    homeManagerNixos =
      {
        inputs,
        pkgs,
        ...
      }:
      let
        meta = zen.miscellaneous.sopsnix.meta;
      in
      {
        imports = [
          inputs.sopsnix.homeModules.sops
        ];

        home.packages = [
          pkgs.sops
          pkgs.age
          pkgs.ssh-to-age
        ];

        home.sessionVariables = {
          SOPS_AGE_KEY_FILE = "${meta.dir}/sops-yubikey";
        };

        sops.age = {
          keyFile = "${meta.dir}/sops-yubikey";
          plugins = [ pkgs.age-plugin-yubikey ];
        };
      };
  };
}
