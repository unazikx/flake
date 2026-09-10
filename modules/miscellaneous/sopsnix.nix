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
      ageDir = ".config/sops/age";
    };

    nixos =
      {
        inputs,
        pkgs,
        lib,
        config,
        host,
        ...
      }:
      let
        meta = zen.miscellaneous.sopsnix.meta;
        haveYubikey = lib.hasInfix "age1yubikey" host.sopsKey;
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

        sops = {
          age =
            if (lib.hasInfix "age1yubikey" host.sopsKey) then
              {
                keyFile = "/root/${meta.ageDir}/keys.txt";
                plugins = [ pkgs.age-plugin-yubikey ];
              }
            else
              {
                keyFile = "/var/lib/keys.txt";
                sshKeyPaths = lib.mapAttrsToList (_: user: "${user.home}/.ssh/id_ed25519") (
                  lib.filterAttrs (_: user: user.isNormalUser) config.users.users
                );
              };
        };

        system.activationScripts = lib.mkIf haveYubikey {
          "identity-age-yubikey" =
            lib.stringAfter [ "users" ]
              # bash
              ''
                DEST=/root/${meta.ageDir}
                mkdir -p $DEST
                ${lib.getExe pkgs.age-plugin-yubikey} --identity > $DEST/keys.txt

                ${lib.concatStringsSep "\n" (
                  lib.mapAttrsToList (
                    name: user:
                    # bash
                    ''
                      DEST=${user.home}/${meta.ageDir}
                      mkdir -p "$DEST"
                      ${lib.getExe pkgs.age-plugin-yubikey} --identity > "$DEST/keys.txt"
                      chown ${name}: "$DEST/keys.txt"
                      chmod 600 "$DEST/keys.txt"
                    '') (lib.filterAttrs (_: user: user.isNormalUser or false) config.users.users)
                )}
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

    homeManager =
      {
        inputs,
        pkgs,
        lib,
        config,
        host,
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

        sops = {
          age =
            if (lib.hasInfix "age1yubikey" host.sopsKey) then
              {
                keyFile = "${config.home.homeDirectory}/${meta.ageDir}/keys.txt";
                plugins = [ pkgs.age-plugin-yubikey ];
              }
            else
              {
                keyFile = "/var/lib/keys.txt";
                sshKeyPaths = lib.singleton "${config.home.homeDirectory}/.ssh/id_ed25519";
              };
        };
      };
  };
}
