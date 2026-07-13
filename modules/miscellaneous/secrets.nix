{
  self,
  ...
}:

{
  zen.miscellaneous.secrets =
    let
      secretsFile = "${self}/configurations/secrets.yaml";
    in
    {
      os =
        {
          inputs,
          pkgs,
          lib,
          config,
          ...
        }:
        {
          imports = [
            inputs.sopsnix.nixosModules.sops
          ];

          environment.systemPackages = [
            pkgs.sops
            pkgs.age
            pkgs.ssh-to-age
          ];

          sops = {
            defaultSopsFile = secretsFile;

            age = {
              sshKeyPaths = lib.mapAttrsToList (_name: user: "${user.home}/.ssh/id_ed25519") (
                lib.filterAttrs (_name: user: user.isNormalUser) config.users.users
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

      homeManagerStandalone =
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
            defaultSopsFile = secretsFile;

            age = {
              keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
              sshKeyPaths = lib.singleton "${config.home.homeDirectory}/.ssh/id_ed25519";
            };
          };
        };
    };
}
