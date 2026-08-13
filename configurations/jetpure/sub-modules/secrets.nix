{
  zen,
  ...
}:

{
  zen.hosts.jetpure = {
    includes = [
      zen.miscellaneous.users
    ];

    nixos =
      {
        self,
        host,
        ...
      }:
      {
        sops.defaultSopsFile = "${self}/secrets/${host.hostName}/generic.yaml";

        sops.secrets = {
          "password/nixzoid" = {
            neededForUsers = true;
          };

          "password/root" = {
            neededForUsers = true;
          };
        };
      };
  };

  zen.users.nixzoid = {
    homeManager =
      {
        self,
        config,
        host,
        ...
      }:
      {
        nix.extraOptions = ''
          !include ${config.sops.templates."nix-access-tokens".path}
        '';

        sops.defaultSopsFile = "${self}/secrets/${host.hostName}/generic.yaml";

        sops.templates = {
          "nix-access-tokens" = {
            content = ''
              access-tokens = github.com=${config.sops.placeholder."programs/github"}
            '';
          };
        };
      };
  };
}
