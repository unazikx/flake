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
      dir = "/var/lib/secrets";
    };

    nixos =
      {
        inputs,
        pkgs,
        lib,
        config,
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
          SOPS_AGE_KEY_FILE = config.sops.age.keyFile;
        };

        sops.age = {
          keyFile = "${meta.dir}/keys.txt";
          plugins = [ pkgs.age-plugin-yubikey ];
        };

        system.activationScripts = {
          "identity-age-yubikey" =
            lib.stringAfter [ "users" ]
              # bash
              ''
                DEST=${meta.dir}; mkdir -p $DEST
                ${lib.getExe pkgs.age-plugin-yubikey} --identity > $DEST/keys.txt
              '';
        };
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

    homeManagerNixos =
      {
        inputs,
        pkgs,
        config,
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
          SOPS_AGE_KEY_FILE = config.sops.age.keyFile;
        };

        sops.age = {
          keyFile = "${meta.dir}/keys.txt";
          plugins = [ pkgs.age-plugin-yubikey ];
        };
      };
  };
}
